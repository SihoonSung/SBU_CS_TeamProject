import React, { useEffect, useState } from 'react';
import './estimate_system.css';

const mergePlayerData = (batting, pitching, fielding) => {
    const merged = {};

    const insert = (player, type) => {
        const key = player.name;
        if (!merged[key]) {
            merged[key] = { 
                name: player.name, 
                uniform: player.uniform || '--', 
                position: player.position || '', 
                primaryPosition: player.primaryPosition || player.position || '' 
            };
        }

        if (type === 'batting') {
            merged[key] = { 
                ...merged[key], 
                battingScore: player.battingScore,
                plateAppearances: player.pa,
                atBats: player.ab
            };
        } else if (type === 'pitching') {
            merged[key] = { 
                ...merged[key], 
                innings: player.ip,
                wins: player.w,
                saves: player.sv,
                holds: player.hld,
                era: player.era
            };
        } else if (type === 'fielding') {
            merged[key] = { 
                ...merged[key], 
                defensiveInnings: player.inn,
                defensiveScore: player.defensiveScore
            };
        }
    };

    batting.forEach(p => insert(p, 'batting'));
    pitching.forEach(p => insert(p, 'pitching'));
    fielding.forEach(p => insert(p, 'fielding'));

    return Object.values(merged);
};

function EstimateSystem() {
    const [players, setPlayers] = useState([]);
    const [goldenGloves, setGoldenGloves] = useState({});

    useEffect(() => {
        const fetchAll = async () => {
            try {
                const [battingRes, pitchingRes, fieldingRes] = await Promise.all([
                    fetch('http://localhost:3001/api/players?type=batting'),
                    fetch('http://localhost:3001/api/players?type=pitching'),
                    fetch('http://localhost:3001/api/players?type=fielding'),
                ]);

                const [battingData, pitchingData, fieldingData] = await Promise.all([
                    battingRes.json(),
                    pitchingRes.json(),
                    fieldingRes.json(),
                ]);

                const mergedPlayers = mergePlayerData(battingData, pitchingData, fieldingData);
                setPlayers(mergedPlayers);
                setGoldenGloves(estimateGoldenGloves(mergedPlayers));
            } catch (err) {
                console.error("Data fetch error:", err);
            }
        };

        fetchAll();
    }, []);

    const estimateGoldenGloves = (players) => {
        const positions = ['P', 'C', '1B', '2B', '3B', 'SS', 'LF', 'CF', 'RF', 'DH'];
        const selected = {};

        for (const pos of positions) {
            const eligible = players.filter(p => isEligible(p, pos));

            if (pos === 'P') {
                eligible.sort((a, b) => b.wins - a.wins || a.era - b.era);
            } else if (pos === 'DH') {
                eligible.sort((a, b) => b.battingScore - a.battingScore);
            } else {
                eligible.sort((a, b) => 
                    (b.defensiveScore + b.battingScore) - 
                    (a.defensiveScore + a.battingScore)
                );
            }

            selected[pos] = eligible[0];
        }

        return selected;
    };

    const isEligible = (p, pos) => {
        if (p.position !== pos) return false;

        if (pos === 'P') {
            return p.innings >= 100 && (p.wins >= 10 || p.saves >= 30 || p.holds >= 30);
        }

        if (pos === 'DH') {
            const isPrimaryFielder = ['C','1B','2B','3B','SS','LF','CF','RF'].includes(p.primaryPosition);
            return !isPrimaryFielder && (p.plateAppearances >= 2/3 * 445 || p.atBats >= 297);
        }

        return p.defensiveInnings >= (144 * 5); // 720 innings
    };

    return (
        <div className="estimate-container">
            <h1>Golden Glove Estimate</h1>
            <div className="field-graphic">
                <div className="diamond-bg"></div>
                {Object.entries(goldenGloves).map(([pos, player]) => (
                    <div key={pos} className={`player-wrapper pos-${pos}`}>
                        <svg xmlns="http://www.w3.org/2000/svg" width="80" height="55" viewBox="0 0 136 90" className="uniform-svg">
                            <path d="M28.7542 8.53984L37.7821 5.67649L48.3146 2.74414H67.8751H87.4356L97.9682 5.67649L106.996 8.53984V84.8499H28.7542V8.53984Z" fill="#C99432"/>
                            <ellipse cx="67.8751" cy="84.3674" rx="39.121" ry="5.31272" fill="#C99432"/>
                            <path
                                d="M88.643 1.29449C88.643 4.22863 79.3449 6.60721 67.8751 6.60721C56.4053 6.60721 47.1072 4.22863 47.1072 1.29449C83.3001 -0.637726 63.9811 5.64077 67.8751 1.29399C76.5385 4.67497 67.3619 1.29403 88.643 1.29449Z"
                                fill={['P', 'C'].includes(pos) ? '#e0e0e0' : 'white'}
                            />
                            <path d="M0.741635 30.3397L28.7544 8.53983L43.9185 27.979L15.8259 49.7785L0.741635 30.3397Z" fill="#C99432"/>
                            <rect width="35.4609" height="24.4796" transform="matrix(-0.790038 -0.613059 -0.613059 0.790038 135.011 30.2793)" fill="#C99432"/>
                        </svg>
                        <div className="player-text">
                            <div className="pos-label">{pos}</div>
                            <div className="name">{shortName(player?.name)}</div>
                            <div className="number">{player?.uniform}</div>
                        </div>
                    </div>
                ))}
            </div>
            <div className="summary">
                <h2>Golden Glove Estimate Summary</h2>
                <ul>
                    {Object.entries(goldenGloves).map(([pos, player]) => (
                        <li key={pos}>{pos} {player?.name || 'N/A'}</li>
                    ))}
                </ul>
            </div>
        </div>
    );
}

function shortName(fullName) {
    if (!fullName) return 'N/A';
    const parts = fullName.split(' ');
    if (parts.length === 1) return parts[0];
    return `${parts[0][0]} ${parts.slice(1).join(' ')}`.toUpperCase();
}

export default EstimateSystem;