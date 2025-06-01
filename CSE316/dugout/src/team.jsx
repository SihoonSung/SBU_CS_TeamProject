import React, { useState, useEffect } from 'react';
import './team.css';

const TeamPage = () => {
    const initialTeams = [
        {
        id: 'ssg',
        name: 'SSG Landers',
        logoUrl: '/images/logos/ssg_landers.png',
        description: 'SSG Landers is a professional baseball team based in Incheon, South Korea. They are part of the KBO League. The team is renowned for their passionate fanbase and exciting gameplay. They are owned by Shinsegae Group, one of Korea\'s leading retail companies.'
        },
        {
        id: 'lg',
        name: 'LG Twins',
        logoUrl: '/images/logos/lg_twins.png',
        description: 'LG Twins are a professional baseball team based in Seoul, South Korea. They are a member of the KBO League. The Twins play their home games at Jamsil Baseball Stadium, which they share with their rivals, the Doosan Bears.'
        },
        {
        id: 'kt',
        name: 'KT Wiz',
        logoUrl: '/images/logos/kt_wiz.png',
        description: 'KT Wiz is a South Korean professional baseball team based in Suwon. They are a member of the KBO League. Their home stadium is Suwon Baseball Stadium. KT Wiz won their first KBO Korean Series championship in 2021.'
        },
        {
        id: 'kia',
        name: 'KIA Tigers',
        logoUrl: '/images/logos/kia_tigers.png',
        description: 'The KIA Tigers are a South Korean professional baseball team founded in 1982 and based in Gwangju. They are a member of the KBO League and are one of the most successful teams in Korean baseball history, having won the Korean Series a record 11 times.'
        },
        {
        id: 'nc',
        name: 'NC Dinos',
        logoUrl: '/images/logos/nc_dinos.png',
        description: 'NC Dinos is a South Korean professional baseball team based in Changwon. They are a member of the KBO League. The Dinos were founded in 2011 and won their first KBO Korean Series championship in 2020.'
        },
        {
        id: 'doosan',
        name: 'Doosan Bears',
        logoUrl: '/images/logos/doosan_bears.png',
        description: 'The Doosan Bears are a professional baseball team based in Seoul, South Korea. They are a member of the KBO League. Founded in 1982, they are one of the original KBO teams and play their home games at Jamsil Baseball Stadium.'
        },
        {
        id: 'lotte',
        name: 'Lotte Giants',
        logoUrl: '/images/logos/lotte_giants.png',
        description: 'The Lotte Giants are a South Korean professional baseball team based in Busan. They are a member of the KBO League. The Giants were founded in 1982 as one of the original KBO teams and play their home games at Sajik Baseball Stadium.'
        },
        {
        id: 'samsung',
        name: 'Samsung Lions',
        logoUrl: '/images/logos/samsung_lions.png',
        description: 'The Samsung Lions are a South Korean professional baseball team founded in 1982, based in Daegu. They are a member of the KBO League. The Lions are one of the most successful teams in KBO history.'
        },
        {
        id: 'hanwha',
        name: 'Hanwha Eagles',
        logoUrl: '/images/logos/hanwha_eagles.png',
        description: 'The Hanwha Eagles are a South Korean professional baseball team based in Daejeon. They are a member of the KBO League. Their home ballpark is Daejeon Hanbat Baseball Stadium.'
        },
        {
        id: 'kiwoom',
        name: 'Kiwoom Heroes',
        logoUrl: '/images/logos/kiwoom_heroes.png',
        description: 'The Kiwoom Heroes are a South Korean professional baseball team based in Seoul. They are a member of the KBO League. Their home stadium is Gocheok Sky Dome.'
        }
    ];

    const [teams, setTeams] = useState(initialTeams);
    const [selectedTeam, setSelectedTeam] = useState(null);

    useEffect(() => {
        if (teams.length > 0) {
        setSelectedTeam(teams[0]);
        }
    }, [teams]);

    const handleSelectTeam = (teamId) => {
        const team = teams.find(t => t.id === teamId);
        setSelectedTeam(team);
    };

    return (
        <div className="team-page-container">
        <h1 className="team-page-title">Select your Team</h1>
        <div className="team-selector-belt">
            {teams.map(team => (
            <button
                key={team.id}
                className={`team-logo-button ${selectedTeam && selectedTeam.id === team.id ? 'selected' : ''}`}
                onClick={() => handleSelectTeam(team.id)}
                aria-label={team.name}
            >
                <img src={team.logoUrl} alt={`${team.name} Logo`} className="team-logo-image-small" />
            </button>
            ))}
        </div>

        {selectedTeam && (
            <div className="selected-team-info-card">
            <div className="selected-team-logo-container">
                <img src={selectedTeam.logoUrl} alt={`${selectedTeam.name} Logo`} className="selected-team-logo-large" />
            </div>
            <div className="selected-team-description-container">
                <h2 className="selected-team-name">{selectedTeam.name}</h2>
                <p className="selected-team-text">{selectedTeam.description}</p>
            </div>
            </div>
        )}
        {!selectedTeam && teams.length > 0 && (
            <p className="team-select-prompt">Please select a team to see details.</p>
        )}
        {!selectedTeam && teams.length === 0 && (
            <p className="team-select-prompt">No teams available.</p>
        )}
        </div>
    );
};

export default TeamPage;