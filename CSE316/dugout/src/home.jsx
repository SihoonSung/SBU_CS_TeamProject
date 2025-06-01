import React, { useEffect, useState } from 'react';
import './home.css';

const teamLogos = {
  "Doosan Bears": "/images/logos/doosan_bears.png",
  "Kiwoom Heroes": "/images/logos/kiwoom_heroes.png",
  "Hanwha Eagles": "/images/logos/hanwha_eagles.png",
  "NC Dinos": "/images/logos/nc_dinos.png",
  "Samsung Lions": "/images/logos/samsung_lions.png",
  "LG Twins": "/images/logos/lg_twins.png",
  "KIA Tigers": "/images/logos/kia_tigers.png",
  "KT Wiz": "/images/logos/kt_wiz.png",
  "SSG Landers": "/images/logos/ssg_landers.png",
  "Lotte Giants": "/images/logos/lotte_giants.png"
};

const translateStatus = (status) => {
  if (status.includes("종료")) return "Finished";
  if (status.includes("경기중")) return "Live";
  if (status.includes("예정")) return "Scheduled";
  if (status.includes("취소")) return "Cancelled";
  if (status.includes("연기")) return "Postponed";
  if (status.includes("중단")) return "Suspended";
  if (status.includes("회초")) return status.replace("회초", "Top");
  if (status.includes("회말")) return status.replace("회말", "Bot");
  return status;
};

const Home = () => {
  const [topPitchers, setTopPitchers] = useState([]);
  const [topBatters, setTopBatters] = useState([]);
  const [liveGames, setLiveGames] = useState([]);
  const myTeam = localStorage.getItem("team");

  useEffect(() => {
    const fetchLeaders = async () => {
      const pRes = await fetch("http://localhost:3001/api/leaders/pitchers");
      const bRes = await fetch("http://localhost:3001/api/leaders/batters");
      const pitchers = await pRes.json();
      const batters = await bRes.json();
      setTopPitchers(pitchers);
      setTopBatters(batters);
    };
    fetchLeaders();
  }, []);

  useEffect(() => {
    const fetchLiveScores = async () => {
      try {
        const res = await fetch("http://localhost:5001/live-scores");
        const data = await res.json();

        const mapped = data.map((game, idx) => ({
          id: idx,
          homeTeam: {
            name: game.team1,
            score: game.score1,
            logoUrl: teamLogos[game.team1.trim()] || '/images/logos/default.png'
          },
          awayTeam: {
            name: game.team2,
            score: game.score2,
            logoUrl: teamLogos[game.team2.trim()] || '/images/logos/default.png'
          },
          status: translateStatus(game.status)
        }));

        setLiveGames(mapped);
      } catch (err) {
        console.error("Live score fetch error:", err);
      }
    };

    fetchLiveScores();
    const interval = setInterval(fetchLiveScores, 300000); // 5분마다
    return () => clearInterval(interval);
  }, []);

  const kboTeams = [
    { id: 1, rank: 1, name: 'SSG Landers', logoUrl: '/images/logos/ssg_landers.png' },
    { id: 2, rank: 2, name: 'Samsung Lions', logoUrl: '/images/logos/samsung_lions.png' },
    { id: 3, rank: 3, name: 'LG Twins', logoUrl: '/images/logos/lg_twins.png' },
    { id: 4, rank: 4, name: 'KT Wiz', logoUrl: '/images/logos/kt_wiz.png' },
    { id: 5, rank: 5, name: 'KIA Tigers', logoUrl: '/images/logos/kia_tigers.png' }
  ];

  return (
    <div className="home-page-container">
      <section className="hero-section" style={{ backgroundImage: "url('/images/background.png')" }}>
        <div className="hero-content">
          <h1>Welcome to Dugout</h1>
          <p>KBO Database Web</p>
        </div>
      </section>

      <div className="main-content-area">
        <section className="kbo-team-ranking-section">
          <h2>KBO Team Ranking</h2>
          <div className="team-list-container">
            {kboTeams.map((team) => (
              <div key={team.id} className="team-rank-item">
                <img src={team.logoUrl} alt={`${team.name} logo`} className="team-logo" />
                <span className="team-rank">{team.rank}</span>
                <span className="team-name">{team.name}</span>
              </div>
            ))}
          </div>
        </section>

        <section className="player-stats-section">
          <div className="stats-column pitcher-column">
            <h3 className="stats-title-vertical">PITCHER</h3>
            <div className="stats-content-box">
              {topPitchers.slice(0, 3).map((p, i) => (
                <p key={i}>
                  {`${i + 1}. ${p.name} (${p.team}) - ERA ${parseFloat(p.era).toFixed(2)}`}
                </p>
              ))}
            </div>
          </div>
          <div className="stats-column batter-column">
            <h3 className="stats-title-vertical">BATTER</h3>
            <div className="stats-content-box">
              {topBatters.slice(0, 3).map((b, i) => {
                const avg = parseFloat(b.avg);
                return (
                  <p key={i}>
                    {`${i + 1}. ${b.name} (${b.team}) - ${
                      isNaN(avg) ? `HR ${b.hr ?? 0}` : `AVG ${avg.toFixed(3)}`
                    }`}
                  </p>
                );
              })}
            </div>
          </div>
        </section>

        <section className="live-scores-section">
          <h2>Live Games</h2>
          {liveGames.length > 0 ? (
            <div className="live-games-grid">
              {liveGames.map((game) => {
                const isMyTeam = game.homeTeam.name === myTeam || game.awayTeam.name === myTeam;
                return (
                  <div key={game.id} className={`game-score-card ${isMyTeam ? "highlight" : ""}`}>
                    <div className="game-team home-team">
                      <img
                        src={game.homeTeam.logoUrl}
                        alt={`${game.homeTeam.name} logo`}
                        className="team-logo-small"
                        onError={(e) => { e.target.src = "/images/logos/default.png"; }}
                      />
                      <span className="team-name">{game.homeTeam.name}</span>
                      <span className="team-score">{game.homeTeam.score}</span>
                    </div>
                    <span className="vs-separator">:</span>
                    <div className="game-team away-team">
                      <span className="team-score">{game.awayTeam.score}</span>
                      <span className="team-name">{game.awayTeam.name}</span>
                      <img
                        src={game.awayTeam.logoUrl}
                        alt={`${game.awayTeam.name} logo`}
                        className="team-logo-small"
                        onError={(e) => { e.target.src = "/images/logos/default.png"; }}
                      />
                    </div>
                    <div className="game-status">{game.status}</div>
                  </div>
                );
              })}
            </div>
          ) : (
            <p>No live games currently.</p>
          )}
        </section>
      </div>
    </div>
  );
};

export default Home;