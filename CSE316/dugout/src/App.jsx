import './App.css';
import { useState, useEffect } from 'react';
import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import { Link } from 'react-router-dom';
import Home from './home';xw

function App() {
  return (
    <Router>
      <>
        <nav>
          <div className="nav-container">
            <ul className="navbar">
              <li className="hideOnMobile">
                <Link to="/facility-list">Facility List</Link>
              </li>
              <li className="hideOnMobile">
                <Link to="/facility-reservation">Facility Reservation</Link>
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
            <Link to="/facility-list">Facility List</Link>
          </li>
          <li>
            <Link to="/facility-reservation">Facility Reservation</Link>
          </li>
        </ul>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/facility-list" element={<FacilityList />} />
          <Route path="/facility-reservation" element={<FacilityReservation />} />
        </Routes>
      </>
    </Router>
  );
}

export default App;