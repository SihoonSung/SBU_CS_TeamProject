import React, { useEffect, useState } from 'react';
import './estimate_system.css';

const mergePlayerData = (batting, pitching, fielding) => {
    const merged = {};
    const insert = (player, type) => {
        const key = player.name;
        if (!merged[key]) {
            merged[key] = {
                name: player.name,
                position: player.position,
                primaryPosition: player.position,
            };
        }
        if (type === 'batting') {
            merged[key] = {
                ...merged[key],
                battingScore: player.battingScore,
                plateAppearances: player.pa,
                atBats: player.ab,
            };
        } else if (type === 'pitching') {
            merged[key] = {
                ...merged[key],
                innings: player.ip,
                wins: player.w,
                saves: player.sv,
                holds: player.hld,
                era: player.era,
                pitcherScore: player.pitcherScore,
            };
        } else if (type === 'fielding') {
            merged[key] = {
                ...merged[key],
                fieldingInnings: player.inn,
                fieldingScore: player.fieldingScore ?? 0,
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
                const battingPositions = ['C', '1B', '2B', '3B', 'SS', 'LF', 'CF', 'RF', 'DH'];
                const fieldingPositions = ['C', '1B', '2B', '3B', 'SS', 'LF', 'CF', 'RF'];
                const battingFetches = battingPositions.map(pos =>
                    fetch(`http://localhost:3001/api/players?type=batting&position=${pos}`)
                        .then(res => res.json())
                        .then(data => data.map(p => ({ ...p, position: pos })))
                );
                const fieldingFetches = fieldingPositions.map(pos =>
                    fetch(`http://localhost:3001/api/players?type=fielding&position=${pos}`)
                        .then(res => res.json())
                        .then(data => data.map(p => ({ ...p, position: pos })))
                );
                const [pitchingRaw, ...battingAndFielding] = await Promise.all([
                    fetch('http://localhost:3001/api/players?type=pitching').then(res => res.json()),
                    ...battingFetches,
                    ...fieldingFetches,
                ]);
                const pitchingRes = pitchingRaw.map(p => ({ ...p, position: 'P' }));
                const battingData = battingAndFielding.slice(0, battingPositions.length).flat();
                const fieldingData = battingAndFielding.slice(battingPositions.length).flat();
                const mergedPlayers = mergePlayerData(battingData, pitchingRes, fieldingData);
                console.log("Pitchers only:",
                    mergedPlayers.filter(p => p.position === 'P')
                );
                console.log("Merged Players:", mergedPlayers.map(p => [p.name, p.position]));
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
                eligible.sort((a, b) => parseFloat(b.pitcherScore || 0) - parseFloat(a.pitcherScore || 0));
                console.log("Sorted Pitchers:", eligible.map(p => [p.name, p.pitcherScore]));
            } else if (pos === 'DH') {
                eligible.sort((a, b) => (b.battingScore || 0) - (a.battingScore || 0));
                console.log("Sorted DHs:", eligible.map(p => [p.name, p.battingScore]));
            } else {
                eligible.sort((a, b) => 
                    ((b.fieldingScore || 0) + (b.battingScore || 0)) -
                    ((a.fieldingScore || 0) + (a.battingScore || 0))
                );
                console.log(`Sorted ${pos}s:`, eligible.map(p => [
                    p.name, 
                    `fielding: ${p.fieldingScore || 0}`, 
                    `batting: ${p.battingScore || 0}`, 
                    `total: ${(p.fieldingScore || 0) + (p.battingScore || 0)}`
                ]));
            }
            selected[pos] = eligible[0];
        }
        return selected;
    };

    const isEligible = (p, pos) => {
        if (!p || !p.position) return false;
        const normalizedPosition = (p.position || '').toUpperCase().trim();
        if (normalizedPosition !== pos) return false;
        if (pos === 'P') {
            return (p.pitcherScore || 0) > 0;
        }
        if (pos === 'DH') {
            const primary = (p.primaryPosition || '').toUpperCase().trim();
            const isPrimaryFielder = ['C','1B','2B','3B','SS','LF','CF','RF'].includes(primary);
            return !isPrimaryFielder && ((p.plateAppearances || 0) > 0 || (p.atBats || 0) > 0);
        }
        return (p.fieldingInnings || 0) > 0 || (p.battingScore || 0) > 0;
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
    const parts = fullName.trim().split(/\s+/);
    if (parts.length === 1) return parts[0]; 
    return `${parts[0][0]} ${parts.slice(1).join(' ')}`.toUpperCase();
}

export default EstimateSystem;