import React, { useState } from 'react';
import './player.css';

const PlayerPage = () => {
    const [searchTerm, setSearchTerm] = useState('');

    const initialTopPitchers = [
        { id: 'p1', rank: 1, name: 'Kim Kwanghyun' },
        { id: 'p2', rank: 2, name: 'Ryu Hyunjin' },
        { id: 'p3', rank: 3, name: 'Yang Hyeonjong' },
        { id: 'p4', rank: 4, name: 'Won Taein' },
        { id: 'p5', rank: 5, name: 'Park Sevoong' },
    ];

    const initialTopBatters = [
        { id: 'b1', rank: 1, name: 'Kim Kwanghyun' },
        { id: 'b2', rank: 2, name: 'Ryu Hyunjin' },
        { id: 'b3', rank: 3, name: 'Yang Hyeonjong' },
        { id: 'b4', rank: 4, name: 'Won Taein' },
        { id: 'b5', rank: 5, name: 'Park Sevoong' },
    ];

    const initialBestPlayers = [
        { position: 'P', name: 'Kim Kwanghyun' },
        { position: 'C', name: 'Kang Minho' },
        { position: '1B', name: 'Chae Eunsung' },
        { position: '2B', name: 'Heang Youngmook' },
        { position: '3B', name: 'Choi Jeong' },
        { position: 'SS', name: 'Park Seonghan' },
        { position: 'LF', name: 'Kim Hyunjun' },
        { position: 'CF', name: 'Choi Jihoon' },
        { position: 'RF', name: 'Song Chanueui' },
        { position: 'DH', name: 'Park Byungho' },
    ];

    const [topPitchers] = useState(initialTopPitchers);
    const [topBatters] = useState(initialTopBatters);
    const [bestPlayers] = useState(initialBestPlayers);

    const handleSearchChange = (event) => {
        setSearchTerm(event.target.value);
    };

    return (
        <div className="player-page-container">
        <div className="player-search-bar-container">
            <input
            type="text"
            className="player-search-input"
            placeholder="Search Players Name or Team"
            value={searchTerm}
            onChange={handleSearchChange}
            />
            <button className="player-search-button" aria-label="Search">
            <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#5f6368">
                <path d="M784-120 532-372q-30 24-69 38t-83 14q-109 0-184.5-75.5T120-580q0-109 75.5-184.5T380-840q109 0 184.5 75.5T640-580q0 44-14 83t-38 69l252 252-56 56ZM380-400q75 0 127.5-52.5T560-580q0-75-52.5-127.5T380-760q-75 0-127.5 52.5T200-580q0 75 52.5 127.5T380-400Z"/>
            </svg>
            </button>
        </div>

        <div className="top-players-section">
            <div className="top-list-container">
            <h2 className="top-list-title">Top Pitcher</h2>
            <ul className="top-list">
                {topPitchers.map(player => (
                <li key={player.id} className="top-list-item">
                    <span className="player-rank">{player.rank}</span>
                    <span className="player-name">{player.name}</span>
                </li>
                ))}
            </ul>
            </div>
            <div className="top-list-container">
            <h2 className="top-list-title">Top Batter</h2>
            <ul className="top-list">
                {topBatters.map(player => (
                <li key={player.id} className="top-list-item">
                    <span className="player-rank">{player.rank}</span>
                    <span className="player-name">{player.name}</span>
                </li>
                ))}
            </ul>
            </div>
        </div>

        <div className="best-player-section">
            <h2 className="best-player-title">Best Player</h2>
            <div className="best-player-content">
            <div className="best-player-list-by-position">
                {bestPlayers.map(player => (
                <div key={player.position} className="position-player-item">
                    <span className="player-position">{player.position}</span>
                    <span className="player-name-bp">{player.name}</span>
                </div>
                ))}
            </div>
            <div className="baseball-diamond-placeholder">
            </div>
            </div>
        </div>
        </div>
    );
};

export default PlayerPage;