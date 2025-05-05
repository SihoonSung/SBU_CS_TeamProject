# SBU_CS_TeamProject
# Baseball Info Platform - CSE316 Project

> A web application that provides KBO real-time game information, player statistics, and a Golden Glove estimator.

## Course Info
- **Course**: CSE316 - Fundamentals of Software Development
- **Semester**: Spring 2025
- **Team Members**:
  - **Sihoon Sung** (Main Page, Player, Schedule)
  - **Mingu Hwang** (Estimate System, Profile/Login, Community)

---

## Project Description

This project is a baseball information platform for KBO fans. It provides:
- Real-time game updates using **MyKBO API**
- Player season statistics using **STATIZ**
- Golden Glove estimator based on custom rules
- User authentication and team-themed profile page
- Community page to share opinions and interact

---

## Technologies Used

- **Frontend**: React (TypeScript), HTML, CSS
- **Backend**: RESTful APIs (MyKBO, STATIZ)
- **Data Handling**: localStorage
- **Tools**: Figma (UI mockup), GitHub

---

## Features

### Main Features
- **Facility-like Team Home Page**
- **Schedule**: Real-time scores via MyKBO
- **Profile/Login**: Login, Sign-Up, Team Color Theme
- **Estimate System**: Golden Glove candidate filtering
- **Community**: Post, like, and comment

### Estimate System Criteria
- **Pitchers**: Must meet one of the following:
  - ≥ 10 Wins
  - ≥ 30 Saves
  - ≥ 30 Holds
  - Minimum innings requirement
- **Fielders**: ≥ 720 innings in defense
- **Designated Hitters (DH)**: ≥ 297 plate appearances

---

## How to Run Locally

```bash
cd baseball-info-platform
npm install
npm start