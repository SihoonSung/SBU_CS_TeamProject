import requests
from bs4 import BeautifulSoup
import pandas as pd
import mysql.connector

def extract_table_data(url, columns, expected_col_count):
    headers = {"User-Agent": "Mozilla/5.0"}
    res = requests.get(url, headers=headers)
    soup = BeautifulSoup(res.text, 'html.parser')
    table = soup.find('table')
    if not table:
        print(f"Cannot find table: {url}")
        return pd.DataFrame()
    rows = table.find_all('tr')

    data = []
    for row in rows[1:]:
        cols = row.find_all('td')
        if not cols:
            continue
        row_data = [col.text.strip() for col in cols]
        if len(row_data) >= expected_col_count:
            data.append(row_data[:expected_col_count])

    return pd.DataFrame(data, columns=columns)


batting_url = "https://statiz.sporki.com/stats/?m=main&m2=batting"
pitching_url = "https://statiz.sporki.com/stats/?m=main&m2=pitching"
fielding_url = "https://statiz.sporki.com/stats/?m=main&m2=fielding"

batting_columns = ["Rank", "Name", "Team", "WAR", "G", "PA", "AB", "R", "H", "2B", "3B", "HR", "TB", "RBI", "SB", "CS", "BB", "HBP", "SO", "AVG", "OBP"]
pitching_columns = ["Rank", "Name", "Team", "WAR", "G", "W", "L", "ERA", "IP", "SO", "SV", "HLD"]
fielding_columns = ["Rank", "Name", "Team", "WAR", "G", "Inn", "dWAR", "E", "A", "PO", "DP"]

df_batting = extract_table_data(batting_url, batting_columns, 21)
df_pitching = extract_table_data(pitching_url, pitching_columns, 12)
df_fielding = extract_table_data(fielding_url, fielding_columns, 11)

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="mingu10133*",
    database="statiz_db"
)
cursor = conn.cursor()

# === Batters with battingScore ===
cursor.execute("""
CREATE TABLE IF NOT EXISTS batters (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    team VARCHAR(20),
    war FLOAT,
    pa INT,
    ab INT,
    hr INT,
    rbi INT,
    battingScore FLOAT
);
""")
cursor.execute("DELETE FROM batters")
for _, row in df_batting.iterrows():
    try:
        war = float(row["WAR"])
        pa = int(row["PA"])
        ab = int(row["AB"])
        hr = int(row["HR"])
        rbi = int(row["RBI"])
        score = hr * 4 + rbi + war * 10
        cursor.execute("""
            INSERT INTO batters (name, team, war, pa, ab, hr, rbi, battingScore)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
        """, (row["Name"], row["Team"], war, pa, ab, hr, rbi, score))
    except:
        continue

# === Pitchers (unchanged) ===
cursor.execute("""
CREATE TABLE IF NOT EXISTS pitchers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    team VARCHAR(20),
    war FLOAT,
    g INT,
    w INT,
    l INT,
    era FLOAT,
    ip FLOAT,
    so INT,
    sv INT,
    hld INT
);
""")
cursor.execute("DELETE FROM pitchers")
for _, row in df_pitching.iterrows():
    try:
        cursor.execute("""
            INSERT INTO pitchers (name, team, war, g, w, l, era, ip, so, sv, hld)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """, (
            row["Name"], row["Team"], float(row["WAR"]), int(row["G"]), int(row["W"]),
            int(row["L"]), float(row["ERA"]), float(row["IP"]), int(row["SO"]),
            int(row["SV"]), int(row["HLD"])
        ))
    except:
        continue

# === Fielders with fieldingScore ===
cursor.execute("""
CREATE TABLE IF NOT EXISTS fielders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    team VARCHAR(20),
    war FLOAT,
    g INT,
    inn FLOAT,
    dwar FLOAT,
    err INT,
    assists INT,
    putouts INT,
    dp INT,
    fieldingScore FLOAT
);
""")
cursor.execute("DELETE FROM fielders")
for _, row in df_fielding.iterrows():
    try:
        dwar = float(row["dWAR"])
        err = int(row["E"])
        assists = int(row["A"])
        po = int(row["PO"])
        score = dwar * 10 - err * 2 + assists * 0.5 + po * 0.5
        cursor.execute("""
            INSERT INTO fielders (name, team, war, g, inn, dwar, err, assists, putouts, dp, fieldingScore)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """, (
            row["Name"], row["Team"], float(row["WAR"]), int(row["G"]), float(row["Inn"]),
            dwar, err, assists, po, int(row["DP"]), score
        ))
    except:
        continue

conn.commit()
cursor.close()
conn.close()
print("All data with scores saved successfully.")