import React from 'react';
import './home.css'; 

const Home = () => {
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
            style={{ backgroundImage: "url('/images/stadium_background.jpg')" }} //사진 경로는 일단 샘플로 해둠
        >
            <div className="hero-content">
            <h1>Welcome to Dugout</h1>
            <p>KBO ~~~ system</p>
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
                <p>1. 안우진 (Kiwoom) - ERA 2.11</p>
                <p>2. 김광현 (SSG) - ERA 2.13</p>
                <p>3. 케이시 켈리 (LG) - ERA 2.54</p>
                </div>
            </div>
            <div className="stats-column batter-column">
                <h3 className="stats-title-vertical">BATTER</h3>
                <div className="stats-content-box">
                <p>1. 이정후 (Kiwoom) - AVG .349</p>
                <p>2. 호세 피렐라 (Samsung) - AVG .342</p>
                <p>3. 박병호 (KT) - HR 35</p>
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