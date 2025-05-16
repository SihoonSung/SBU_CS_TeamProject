import './App.css';
import { useState, useEffect } from 'react';
import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import { Link } from 'react-router-dom';
import Home from './home.jsx';
import Team from './team';
import Player from './player';
import Schedule from './schedule';
import EstimateSystem from './estimate_system';
import Community from './community';
import Login from './login';


function App() {
  const [sidebarVisible, setSidebarVisible] = useState(false);

  const toggleSidebar = () => {
    setSidebarVisible(!sidebarVisible);
  };
  return (
    <Router>
      <>
        <nav>
          <div className="nav-container">
            <ul className="navbar">
              <li className="hideOnMobile">
                <Link to="/">KBO</Link>
              </li>
              <li className="hideOnMobile">
                <Link to="/team">Team</Link>
              </li>
              <li className="hideOnMobile">
                <Link to="/player">Player</Link>
              </li>
              <li className="hideOnMobile">
                <Link to="/schedule">Schedule</Link>
              </li>
              <li className="hideOnMobile">
                <Link to="/estimate-system">Estimate System</Link>
              </li>
              <li className="hideOnMobile">
                <Link to="/community">Community</Link>
              </li>
              <li className="hideOnMobile">
                <Link to="/login">Login</Link>
              </li>
              <li className="menu-button" onClick={toggleSidebar}>
                <svg id="menu" xmlns="http://www.w3.org/2000/svg" height="25px" viewBox="0 -1200 960 960" width="25px" fill="white">
                  <path d="M120-240v-80h720v80H120Zm0-200v-80h720v80H120Zm0-200v-80h720v80H120Z" />
                </svg>
              </li>
            </ul>
          </div>
        </nav>

        <ul className="sidebar" id="sidebar" style={{ display: sidebarVisible ? 'flex' : 'none' }}>
          <li>
            <Link to="/team">Team</Link>
          </li>
          <li>
            <Link to="/player">Player</Link>
          </li>
          <li>
            <Link to="/schedule">Schedule</Link>
          </li>
          <li>
            <Link to="/estimate-system">Estimate System</Link>
          </li>
          <li>
            <Link to="/community">Community</Link>
          </li>
          <li>
            <Link to="/login">Login</Link>
          </li>
        </ul>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/team" element={<Team />} />
          <Route path="/player" element={<Player />} />
          <Route path="/schedule" element={<Schedule />} />
          <Route path="/estimate-system" element={<EstimateSystem />} />
          <Route path="/community" element={<Community />} />
          <Route path="/login" element={<Login />} />
        </Routes>
      </>
    </Router>
  );
}

export default App;