import React, { useEffect, useState } from 'react';
import './schedule.css';

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

export default function SchedulePage() {
  const [schedule, setSchedule] = useState({ periodTitle: '', days: [] });

  useEffect(() => {
    fetch("http://localhost:5001/weekly-schedule")
      .then(res => res.json())
      .then(data => {
        const days = data.map((day, idx) => ({
          dayName: ["Tue", "Wed", "Thu", "Fri", "Sat", "Sun"][idx],
          games: day.games.map((g, i) => ({
            id: `${day.date}-g${i}`,
            team1: {
              name: g.team1,
              logoUrl: teamLogos[g.team1] || "/images/logos/default.png"
            },
            team2: {
              name: g.team2,
              logoUrl: teamLogos[g.team2] || "/images/logos/default.png"
            },
            score1: g.score1,
            score2: g.score2,
            status: g.status 
          }))
        }));
        setSchedule({ periodTitle: "This Week", days });
      });
  }, []);

  return (
    <div className="schedule-page-container">
      <h1 className="schedule-period-title">{schedule.periodTitle}</h1>
      <div className="schedule-grid-container">
        {schedule.days.map(day => (
          <div key={day.dayName} className="schedule-day-column">
            <h2 className="schedule-day-name">{day.dayName}</h2>
            <div className="schedule-games-list">
              {day.games.map(game => (
                <div key={game.id} className="schedule-game-item">
                  <img src={game.team1.logoUrl} alt={game.team1.name} className="schedule-game-logo" />
                  {game.status?.includes("취소") ? (
                    <span className="schedule-game-cancelled">Cancelled</span>
                  ) : game.score1 !== "" && game.score2 !== "" ? (
                    <span className="schedule-game-score">{game.score1} : {game.score2}</span>
                  ) : (
                    <span className="schedule-game-vs">vs</span>
                  )}
                  <img src={game.team2.logoUrl} alt={game.team2.name} className="schedule-game-logo" />
                </div>
              ))}
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}