import React, { useState } from 'react';
import './schedule.css';

const SchedulePage = () => {
  const initialSchedule = {
    periodTitle: "Week 4, April",
    days: [
      {
        dayName: "Tue",
        games: [
          { id: 'g1t', team1: { name: 'KIA Tigers', logoUrl: '/images/logos/kia_tigers.png' }, team2: { name: 'Doosan Bears', logoUrl: '/images/logos/doosan_bears.png' }, score1: 6, score2: 4 },
          { id: 'g2t', team1: { name: 'LG Twins', logoUrl: '/images/logos/lg_twins.png' }, team2: { name: 'SSG Landers', logoUrl: '/images/logos/ssg_landers.png' }, score1: 2, score2: 7 },
          { id: 'g3t', team1: { name: 'NC Dinos', logoUrl: '/images/logos/nc_dinos.png' }, team2: { name: 'Lotte Giants', logoUrl: '/images/logos/lotte_giants.png' }, score1: 5, score2: 3 },
          { id: 'g4t', team1: { name: 'Samsung Lions', logoUrl: '/images/logos/samsung_lions.png' }, team2: { name: 'KT Wiz', logoUrl: '/images/logos/kt_wiz.png' }, score1: 8, score2: 2 },
          { id: 'g5t', team1: { name: 'Kiwoom Heroes', logoUrl: '/images/logos/kiwoom_heroes.png' }, team2: { name: 'Hanwha Eagles', logoUrl: '/images/logos/hanwha_eagles.png' }, score1: 11, score2: 5 },
        ]
      },
      {
        dayName: "Wed",
        games: [
          { id: 'g1w', team1: { name: 'KIA Tigers', logoUrl: '/images/logos/kia_tigers.png' }, team2: { name: 'Doosan Bears', logoUrl: '/images/logos/doosan_bears.png' }, score1: 6, score2: 4 },
          { id: 'g2w', team1: { name: 'LG Twins', logoUrl: '/images/logos/lg_twins.png' }, team2: { name: 'SSG Landers', logoUrl: '/images/logos/ssg_landers.png' }, score1: 2, score2: 7 },
          { id: 'g3w', team1: { name: 'NC Dinos', logoUrl: '/images/logos/nc_dinos.png' }, team2: { name: 'Lotte Giants', logoUrl: '/images/logos/lotte_giants.png' }, score1: 5, score2: 3 },
          { id: 'g4w', team1: { name: 'Samsung Lions', logoUrl: '/images/logos/samsung_lions.png' }, team2: { name: 'KT Wiz', logoUrl: '/images/logos/kt_wiz.png' }, score1: 8, score2: 2 },
          { id: 'g5w', team1: { name: 'Kiwoom Heroes', logoUrl: '/images/logos/kiwoom_heroes.png' }, team2: { name: 'Hanwha Eagles', logoUrl: '/images/logos/hanwha_eagles.png' }, score1: 11, score2: 5 },
        ]
      },
      {
        dayName: "Thu",
        games: [
          { id: 'g1th', team1: { name: 'KIA Tigers', logoUrl: '/images/logos/kia_tigers.png' }, team2: { name: 'Doosan Bears', logoUrl: '/images/logos/doosan_bears.png' } },
          { id: 'g2th', team1: { name: 'LG Twins', logoUrl: '/images/logos/lg_twins.png' }, team2: { name: 'SSG Landers', logoUrl: '/images/logos/ssg_landers.png' } },
          { id: 'g3th', team1: { name: 'NC Dinos', logoUrl: '/images/logos/nc_dinos.png' }, team2: { name: 'Lotte Giants', logoUrl: '/images/logos/lotte_giants.png' } },
          { id: 'g4th', team1: { name: 'Samsung Lions', logoUrl: '/images/logos/samsung_lions.png' }, team2: { name: 'KT Wiz', logoUrl: '/images/logos/kt_wiz.png' } },
          { id: 'g5th', team1: { name: 'Kiwoom Heroes', logoUrl: '/images/logos/kiwoom_heroes.png' }, team2: { name: 'Hanwha Eagles', logoUrl: '/images/logos/hanwha_eagles.png' } },
        ]
      },
      {
        dayName: "Fri",
        games: [
          { id: 'g1f', team1: { name: 'SSG Landers', logoUrl: '/images/logos/ssg_landers.png' }, team2: { name: 'KIA Tigers', logoUrl: '/images/logos/kia_tigers.png' } },
          { id: 'g2f', team1: { name: 'Doosan Bears', logoUrl: '/images/logos/doosan_bears.png' }, team2: { name: 'LG Twins', logoUrl: '/images/logos/lg_twins.png' } },
          { id: 'g3f', team1: { name: 'Lotte Giants', logoUrl: '/images/logos/lotte_giants.png' }, team2: { name: 'NC Dinos', logoUrl: '/images/logos/nc_dinos.png' } },
          { id: 'g4f', team1: { name: 'KT Wiz', logoUrl: '/images/logos/kt_wiz.png' }, team2: { name: 'Samsung Lions', logoUrl: '/images/logos/samsung_lions.png' } },
          { id: 'g5f', team1: { name: 'Hanwha Eagles', logoUrl: '/images/logos/hanwha_eagles.png' }, team2: { name: 'Kiwoom Heroes', logoUrl: '/images/logos/kiwoom_heroes.png' } },
        ]
      },
      {
        dayName: "Sat",
        games: [
          { id: 'g1sa', team1: { name: 'SSG Landers', logoUrl: '/images/logos/ssg_landers.png' }, team2: { name: 'KIA Tigers', logoUrl: '/images/logos/kia_tigers.png' } },
          { id: 'g2sa', team1: { name: 'Doosan Bears', logoUrl: '/images/logos/doosan_bears.png' }, team2: { name: 'LG Twins', logoUrl: '/images/logos/lg_twins.png' } },
          { id: 'g3sa', team1: { name: 'Lotte Giants', logoUrl: '/images/logos/lotte_giants.png' }, team2: { name: 'NC Dinos', logoUrl: '/images/logos/nc_dinos.png' } },
          { id: 'g4sa', team1: { name: 'KT Wiz', logoUrl: '/images/logos/kt_wiz.png' }, team2: { name: 'Samsung Lions', logoUrl: '/images/logos/samsung_lions.png' } },
          { id: 'g5sa', team1: { name: 'Hanwha Eagles', logoUrl: '/images/logos/hanwha_eagles.png' }, team2: { name: 'Kiwoom Heroes', logoUrl: '/images/logos/kiwoom_heroes.png' } },
        ]
      },
      {
        dayName: "Sun",
        games: [
          { id: 'g1su', team1: { name: 'SSG Landers', logoUrl: '/images/logos/ssg_landers.png' }, team2: { name: 'KIA Tigers', logoUrl: '/images/logos/kia_tigers.png' } },
          { id: 'g2su', team1: { name: 'Doosan Bears', logoUrl: '/images/logos/doosan_bears.png' }, team2: { name: 'LG Twins', logoUrl: '/images/logos/lg_twins.png' } },
          { id: 'g3su', team1: { name: 'Lotte Giants', logoUrl: '/images/logos/lotte_giants.png' }, team2: { name: 'NC Dinos', logoUrl: '/images/logos/nc_dinos.png' } },
          { id: 'g4su', team1: { name: 'KT Wiz', logoUrl: '/images/logos/kt_wiz.png' }, team2: { name: 'Samsung Lions', logoUrl: '/images/logos/samsung_lions.png' } },
          { id: 'g5su', team1: { name: 'Hanwha Eagles', logoUrl: '/images/logos/hanwha_eagles.png' }, team2: { name: 'Kiwoom Heroes', logoUrl: '/images/logos/kiwoom_heroes.png' } },
        ]
      },
    ]
  };

  const [schedule, setSchedule] = useState(initialSchedule);

  const handlePrevWeek = () => {
    console.log("Previous week clicked");
  };

  const handleNextWeek = () => {
    console.log("Next week clicked");
  };

  const handleCalendarView = () => {
    console.log("Calendar view clicked");
  };

  const handleDateSelect = () => {
    console.log("Date select clicked");
  };

  return (
    <div className="schedule-page-container">
      <h1 className="schedule-period-title">{schedule.periodTitle}</h1>
      <div className="schedule-grid-container">
        {schedule.days.map(dayData => (
          <div key={dayData.dayName} className="schedule-day-column">
            <h2 className="schedule-day-name">{dayData.dayName}</h2>
            <div className="schedule-games-list">
              {dayData.games.map(game => (
                <div key={game.id} className="schedule-game-item">
                  <img src={game.team1.logoUrl} alt={game.team1.name} className="schedule-game-logo" />
                  {game.score1 !== undefined && game.score2 !== undefined ? (
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
      <div className="schedule-controls">
        <button onClick={handlePrevWeek} className="schedule-control-button" aria-label="Previous Week">
          <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#333"><path d="M400-80 0-480l400-400 71 71-329 329 329 329-71 71Z"/></svg>
        </button>
        <button onClick={handleDateSelect} className="schedule-control-button" aria-label="Select Date">
           <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#333"><path d="M200-80q-33 0-56.5-23.5T120-160v-560q0-33 23.5-56.5T200-800h40v-80h80v80h320v-80h80v80h40q33 0 56.5 23.5T840-720v560q0 33-23.5 56.5T760-80H200Zm0-80h560v-400H200v400Zm0-480h560v-80H200v80Zm0 0v-80 80Zm280 240q-17 0-28.5-11.5T440-440q0-17 11.5-28.5T480-480q17 0 28.5 11.5T520-440q0 17-11.5 28.5T480-400Zm-160 0q-17 0-28.5-11.5T280-440q0-17 11.5-28.5T320-480q17 0 28.5 11.5T360-440q0 17-11.5 28.5T320-400Zm320 0q-17 0-28.5-11.5T600-440q0-17 11.5-28.5T640-480q17 0 28.5 11.5T680-440q0 17-11.5 28.5T640-400ZM480-640q-17 0-28.5-11.5T440-680q0-17 11.5-28.5T480-720q17 0 28.5 11.5T520-680q0 17-11.5 28.5T480-640Zm-160 0q-17 0-28.5-11.5T280-680q0-17 11.5-28.5T320-720q17 0 28.5 11.5T360-680q0 17-11.5 28.5T320-640Zm320 0q-17 0-28.5-11.5T600-680q0-17 11.5-28.5T640-720q17 0 28.5 11.5T680-680q0 17-11.5 28.5T640-640Z"/></svg>
        </button>
        <button onClick={handleCalendarView} className="schedule-control-button" aria-label="Calendar View">
           <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#333"><path d="M480-80q-75 0-140.5-28.5T226-192q-49 49-111 73T0-80v-80q53 0 105.5-15.5T221-201q-22-24-35.5-52t-13.5-57q0-75 52.5-127.5T352-490v-110h-80v-80h80v-160h80v160h240v-160h80v160h80v80h-80v110q75 0 127.5 52.5T880-320q0 29-13.5 57T831-201q48 26 100.5 41.5T1040-120v80q-115 0-226-39T607-236q-46 31-97.5 48.5T400-160h-80q-33 0-56.5-23.5T240-240v-80q0 21 7 39.5t19 34.5l31 29q43 42 98 66.5T520-80h280q62 0 119-25.5T1000-180q-44-34-76-78.5T878-320q0-53-30-95.5t-82-66.5v-98h-80v80H432v-80h-80v98q-52 24-82 66.5T240-320q0 29 13.5 57T289-201q-48 26-100.5 41.5T-80-120v80q115 0 226-39T253-236q46 31 97.5 48.5T480-160Zm0-160Z"/></svg>
        </button>
        <button onClick={handleNextWeek} className="schedule-control-button" aria-label="Next Week">
          <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#333"><path d="m321-80-71-71 329-329-329-329 71-71 400 400-400 400Z"/></svg>
        </button>
      </div>
    </div>
  );
};

export default SchedulePage;
