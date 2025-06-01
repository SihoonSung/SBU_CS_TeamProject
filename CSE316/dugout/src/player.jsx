import React, { useState, useEffect } from 'react';
import './player.css';

const PlayerPage = () => {
    const [topPitchers, setTopPitchers] = useState([]);
    const [topBatters, setTopBatters] = useState([]);
    const [bestPlayers, setBestPlayers] = useState([]);
    const [suggestions, setSuggestions] = useState([]);
    const [searchTerm, setSearchTerm] = useState('');
    const [allPlayers, setAllPlayers] = useState([]);
    
    useEffect(() => {
        const fetchLeaders = async () => {
            try {
            const [pitcherRes, batterRes] = await Promise.all([
                fetch('http://localhost:3001/api/leaders/pitchers'),
                fetch('http://localhost:3001/api/leaders/batters'),
            ]);
            const [topPitchersData, topBattersData] = await Promise.all([
                pitcherRes.json(),
                batterRes.json(),
            ]);
            setTopPitchers(topPitchersData);
            setTopBatters(topBattersData);
            } catch (err) {
            console.error("Top players fetch error:", err);
            }
        };
        fetchLeaders();
    }, []);

    useEffect(() => {
        const fetchBestPlayers = async () => {
            try {
            const res = await fetch("http://localhost:3001/api/leaders/best");
            const data = await res.json();
            setBestPlayers(data);
            } catch (err) {
            console.error("Best players fetch error:", err);
            }
        };

        fetchBestPlayers();
    }, []);

    const fetchAllPlayers = async () => {
        const battingPositions = ['C', '1B', '2B', '3B', 'SS', 'LF', 'CF', 'RF', 'DH'];
        const fieldingPositions = ['C', '1B', '2B', '3B', 'SS', 'LF', 'CF', 'RF'];

        const battingPromises = battingPositions.map(pos =>
            fetch(`http://localhost:3001/api/players?type=batting&position=${pos}`).then(res => res.json())
        );

        const fieldingPromises = fieldingPositions.map(pos =>
            fetch(`http://localhost:3001/api/players?type=fielding&position=${pos}`).then(res => res.json())
        );

        const pitchingPromise = fetch(`http://localhost:3001/api/players?type=pitching`).then(res => res.json());

        const [pitchers, ...rest] = await Promise.all([
            pitchingPromise,
            ...battingPromises,
            ...fieldingPromises
        ]);

        const players = [...pitchers, ...rest.flat()];
        return players;
    };

    useEffect(() => {
        const fetchAndCachePlayers = async () => {
            const all = await fetchAllPlayers();
            setAllPlayers(all);
        };
        fetchAndCachePlayers();
    }, []);

    const handleSearchChange = (event) => {
        const value = event.target.value.toLowerCase();
        setSearchTerm(value);

        const rawSuggestions = allPlayers.flatMap(p => [p.name, p.team]);
        const unique = Array.from(new Set(rawSuggestions.filter(Boolean)))
            .filter(val => val.toLowerCase().startsWith(value))
            .slice(0, 10);

        setSuggestions(unique);
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
                {searchTerm && suggestions.length > 0 && (
                    <ul className="autocomplete-list">
                        {suggestions.map((item, idx) => (
                            <li
                            key={idx}
                            className="autocomplete-item"
                            onClick={() => {
                                setSearchTerm(item);
                                setSuggestions([]);
                            }}
                            >
                            {item}
                            </li>
                        ))}
                    </ul>
                )}
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
                    {topPitchers.map((player, index) => (
                        <li key={player.id || index} className="top-list-item">
                        <span className="player-rank">{player.rank}</span>
                            {`${player.name} (${player.team}) - ${player.era ? `ERA ${player.era}` : `AVG ${player.avg.toFixed(3)}`}`}
                        </li>
                    ))}
                    </ul>
                </div>
                <div className="top-list-container">
                    <h2 className="top-list-title">Top Batter</h2>
                    <ul className="top-list">
                    {topBatters.map((player, index) => (
                        <li key={player.id || index} className="top-list-item">
                        <span className="player-rank">{player.rank}</span>
                        <span className="player-name">
                            {`${player.name} (${player.team}) - ${player.era ? `ERA ${player.era}` : `AVG ${player.avg.toFixed(3)}`}`}
                        </span>
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
                        <span className="player-name-bp">{player.name} ({player.team}) - WAR {player.war?.toFixed(1)}</span>
                        </div>
                    ))}
                    </div>
                    <div className="baseball-diamond-placeholder"></div>
                </div>
            </div>
        </div>
    );
};

export default PlayerPage;