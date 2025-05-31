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
import MyInformation from './my_information';
import Login from './login';
import Signup from './signup';

function App() {
  const [sidebarVisible, setSidebarVisible] = useState(false);
  const [activeDropdown, setActiveDropdown] = useState(null);
  const [loggedIn, setLoggedIn] = useState(false);
  const [userProfile, setUserProfile] = useState(null);

  const toggleSidebar = () => {
    setSidebarVisible(!sidebarVisible);
  };

  const handleDropdownClick = (id) => {
    setActiveDropdown((prev) => (prev === id ? null : id));
  };

  useEffect(() => {
    const handleClickOutside = (event) => {
      const isDropdown = event.target.closest(".dropdown");
      if (!isDropdown) {
        setActiveDropdown(null);
      }
    };
    document.addEventListener("click", handleClickOutside);
    return () => document.removeEventListener("click", handleClickOutside);
  }, []);

  useEffect(() => {
    const handleResize = () => {
      if(window.innerWidth > 600) {
        setSidebarVisible(false);
        setActiveDropdown(null);
      }
    };
    window.addEventListener("resize", handleResize);
    return () => window.removeEventListener("resize", handleResize);
  }, []);

  const handleSignOut = () => {
    setLoggedIn(false);
    setUserProfile(null);
    Navigate("/sign");
  }
  return (
    <Router>
      <>
        <nav>
          <div className="nav-container">
            <ul className="navbar">
              <li className="hideOnMobile">
                <Link to="/">KBO</Link>
              </li>
              <li className={`dropdown hideOnMobile ${activeDropdown === 'top' ? 'active' : ''}`}>
                <a href="#" className="dropdown-toggle" onClick={() => handleDropdownClick('top')}>
                  Dugout
                  <svg xmlns="http://www.w3.org/2000/svg" height="25px" viewBox="0 -960 960 960" width="25px" fill="white">
                    <path d="M480-360 280-560h400L480-360Z" />
                  </svg>
                </a>
                <ul className="dropdown-menu">
                  <li>
                    <Link to="/team">Team</Link>
                  </li>
                  <li>
                    <Link to="/player">Player</Link>
                  </li>
                  <li>
                    <Link to="/schedule">Schedule</Link>
                  </li>
                </ul>
              </li>
              <li className="hideOnMobile">
                <Link to="/estimate-system">Estimate System</Link>
              </li>
              <li className="hideOnMobile">
                <Link to="/community">Community</Link>
              </li>
              <li className="hideOnMobile">
                <Link to="/my-information">My Information</Link>
              </li>
              <li className="hideOnMobile">
                {loggedIn ? (
                  <Link to="/home" onClick={handleSignOut}>Logout</Link>
                ) : (
                  <Link to="/login">Login</Link>
                )
                }
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
          <li className={`dropdown ${activeDropdown === 'side' ? 'active' : ''}`}>
            <a href="#" className="dropdown-toggle" onClick={() => handleDropdownClick('side')}>
              Dugout
              <svg xmlns="http://www.w3.org/2000/svg" height="25px" viewBox="0 -960 960 960" width="25px" fill="#1f1f1f">
                <path d="M480-360 280-560h400L480-360Z" />
              </svg>
            </a>
            <ul className="dropdown-menu">
              <li>
                <Link to="/team">Team</Link>
              </li>
              <li>
                <Link to="/player">Player</Link>
              </li>
              <li>
                <Link to="/schedule">Schedule</Link>
              </li>
            </ul>
          </li>
          <li>
            <Link to="/estimate-system">Estimate System</Link>
          </li>
          <li>
            <Link to="/community">Community</Link>
          </li>
          <li>
            <Link to="/my-information">My Information</Link>
          </li>
          <li>
            {loggedIn ? (
              <Link to="/" onClick={handleSignOut}>Logout</Link>
            ) : (
              <Link to="/login">Login</Link>
            )
            }
          </li>
        </ul>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/team" element={<Team />} />
          <Route path="/player" element={<Player />} />
          <Route path="/schedule" element={<Schedule />} />
          <Route path="/estimate-system" element={<EstimateSystem />} />
          <Route path="/community" element={<Community />} />
          <Route path="/my-information" element={<MyInformation userProfile={userProfile} setUserProfile={setUserProfile}/>} />
          <Route path="/login" element={<Login setLoggedIn={setLoggedIn} setUserProfile={setUserProfile} loggedIn={loggedIn}/>} />
          <Route path="/signup" element={<Signup setLoggedIn={setLoggedIn} setUserProfile={setUserProfile}/>} />
        </Routes>
      </>
    </Router>
  );
}

export default App;