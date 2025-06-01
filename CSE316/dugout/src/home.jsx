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

const Home = () => {
    const [topPitchers, setTopPitchers] = useState([]);
    const [topBatters, setTopBatters] = useState([]);

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

    const kboTeams = [
        { id: 1, rank: 1, name: 'SSG Landers', logoUrl: '/images/logos/ssg_landers.png' },
        { id: 2, rank: 2, name: 'SAMSUNG Lions', logoUrl: '/images/logos/samsung_lions.png' },
        { id: 3, rank: 3, name: 'LG Twins', logoUrl: '/images/logos/lg_twins.png' },
        { id: 4, rank: 4, name: 'KT Wiz', logoUrl: '/images/logos/kt_wiz.png' },
        { id: 5, rank: 5, name: 'KIA Tigers', logoUrl: '/images/logos/kia_tigers.png' },



    ];

    const liveGames = [
        { id: 1, homeTeam: { name: 'Eagles', score: 9, logoUrl: '/images/logos/hanwha_eagles.png' }, awayTeam: { name: 'Giants', score: 4, logoUrl: '/images/logos/lotte_giants.png' }, status: '종료'},
        { id: 2, homeTeam: { name: 'Tigers', score: 0, logoUrl: '/images/logos/kia_tigers.png' }, awayTeam: { name: 'Lions', score: 11, logoUrl: '/images/logos/samsung_lions.png' }, status: '8회초'},
        { id: 3, homeTeam: { name: 'Dinos', score: 1, logoUrl: '/images/logos/nc_dinos.png' }, awayTeam: { name: 'Twins', score: 3, logoUrl: '/images/logos/lg_twins.png' }, status: '경기중'},
        { id: 4, homeTeam: { name: 'Bears', score: 5, logoUrl: '/images/logos/doosan_bears.png' }, awayTeam: { name: 'Wiz', score: 4, logoUrl: '/images/logos/kt_wiz.png' }, status: '7회말'},
        { id: 5, homeTeam: { name: 'Landers', score: 7, logoUrl: '/images/logos/ssg_landers.png' }, awayTeam: { name: 'Heroes', score: 2, logoUrl: '/images/logos/kiwoom_heroes.png' }, status: '경기중'},


    ];

    return (
        <div className="home-page-container"> 
        <section 
            className="hero-section" 
            style={{ backgroundImage: "url('/images/background.png')" }} 
        >
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
                    <img src={team.logoUrl} alt={`${team.name} 로고`} className="team-logo" />
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
                {liveGames.map((game) => (
                    <div key={game.id} className="game-score-card">
                    <div className="game-team home-team">
                        <img src={game.homeTeam.logoUrl} alt={`${game.homeTeam.name} 로고`} className="team-logo-small" />
                        <span className="team-name">{game.homeTeam.name}</span>
                        <span className="team-score">{game.homeTeam.score}</span>
                    </div>
                    <span className="vs-separator">:</span>
                    <div className="game-team away-team">
                        <span className="team-score">{game.awayTeam.score}</span>
                        <span className="team-name">{game.awayTeam.name}</span>
                        <img src={game.awayTeam.logoUrl} alt={`${game.awayTeam.name} 로고`} className="team-logo-small" />
                    </div>
                    <div className="game-status">{game.status}</div>
                    </div>
                ))}
                </div>
            ) : (
                <p>현재 진행 중인 경기가 없습니다.</p>
            )}
            </section>
        </div>
        </div>
    );
};

export default Home;