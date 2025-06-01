import requests
from bs4 import BeautifulSoup
import pandas as pd
import mysql.connector

position_map = {
    'C': 'C', '1B': '1B', '2B': '2B', '3B': '3B', 'SS': 'SS',
    'LF': 'LF', 'CF': 'CF', 'RF': 'RF', 'DH': 'DH', 'P': 'P'
}

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

def create_batter_table_if_not_exists(position, cursor):
    cursor.execute(f"""
        CREATE TABLE IF NOT EXISTS batters_{position} (
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
    cursor.execute(f"DELETE FROM batters_{position}")

def create_fielder_table_if_not_exists(position, cursor):
    cursor.execute(f"""
        CREATE TABLE IF NOT EXISTS fielders_{position} (
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
    cursor.execute(f"DELETE FROM fielders_{position}")

batting_urls = {
    "1B": "https://statiz.sporki.com/stats/?m=main&m2=batting&m3=default&so=WAR&ob=DESC&year=2025&sy=&ey=&te=&po=3&lt=10100&reg=A&pe=&ds=&de=&we=&hr=&ha=&ct=&st=&vp=&bo=&pt=&pp=&ii=&vc=&um=&oo=&rr=&sc=&bc=&ba=&li=&as=&ae=&pl=&gc=&lr=&pr=50&ph=&hs=&us=&na=&ls=&sf1=&sk1=&sv1=&sf2=&sk2=&sv2=",
    "2B": "https://statiz.sporki.com/stats/?m=main&m2=batting&m3=default&so=WAR&ob=DESC&year=2025&sy=&ey=&te=&po=4&lt=10100&reg=A&pe=&ds=&de=&we=&hr=&ha=&ct=&st=&vp=&bo=&pt=&pp=&ii=&vc=&um=&oo=&rr=&sc=&bc=&ba=&li=&as=&ae=&pl=&gc=&lr=&pr=50&ph=&hs=&us=&na=&ls=&sf1=&sk1=&sv1=&sf2=&sk2=&sv2=",
    "3B": "https://statiz.sporki.com/stats/?m=main&m2=batting&m3=default&so=WAR&ob=DESC&year=2025&sy=&ey=&te=&po=5&lt=10100&reg=A&pe=&ds=&de=&we=&hr=&ha=&ct=&st=&vp=&bo=&pt=&pp=&ii=&vc=&um=&oo=&rr=&sc=&bc=&ba=&li=&as=&ae=&pl=&gc=&lr=&pr=50&ph=&hs=&us=&na=&ls=&sf1=&sk1=&sv1=&sf2=&sk2=&sv2=",
    "SS": "https://statiz.sporki.com/stats/?m=main&m2=batting&m3=default&so=WAR&ob=DESC&year=2025&sy=&ey=&te=&po=6&lt=10100&reg=A&pe=&ds=&de=&we=&hr=&ha=&ct=&st=&vp=&bo=&pt=&pp=&ii=&vc=&um=&oo=&rr=&sc=&bc=&ba=&li=&as=&ae=&pl=&gc=&lr=&pr=50&ph=&hs=&us=&na=&ls=&sf1=&sk1=&sv1=&sf2=&sk2=&sv2=",
    "C": "https://statiz.sporki.com/stats/?m=main&m2=batting&m3=default&so=WAR&ob=DESC&year=2025&sy=&ey=&te=&po=2&lt=10100&reg=A&pe=&ds=&de=&we=&hr=&ha=&ct=&st=&vp=&bo=&pt=&pp=&ii=&vc=&um=&oo=&rr=&sc=&bc=&ba=&li=&as=&ae=&pl=&gc=&lr=&pr=50&ph=&hs=&us=&na=&ls=&sf1=&sk1=&sv1=&sf2=&sk2=&sv2=",
    "LF": "https://statiz.sporki.com/stats/?m=main&m2=batting&m3=default&so=WAR&ob=DESC&year=2025&sy=&ey=&te=&po=7&lt=10100&reg=A&pe=&ds=&de=&we=&hr=&ha=&ct=&st=&vp=&bo=&pt=&pp=&ii=&vc=&um=&oo=&rr=&sc=&bc=&ba=&li=&as=&ae=&pl=&gc=&lr=&pr=50&ph=&hs=&us=&na=&ls=&sf1=&sk1=&sv1=&sf2=&sk2=&sv2=",
    "CF": "https://statiz.sporki.com/stats/?m=main&m2=batting&m3=default&so=WAR&ob=DESC&year=2025&sy=&ey=&te=&po=8&lt=10100&reg=A&pe=&ds=&de=&we=&hr=&ha=&ct=&st=&vp=&bo=&pt=&pp=&ii=&vc=&um=&oo=&rr=&sc=&bc=&ba=&li=&as=&ae=&pl=&gc=&lr=&pr=50&ph=&hs=&us=&na=&ls=&sf1=&sk1=&sv1=&sf2=&sk2=&sv2=",
    "RF": "https://statiz.sporki.com/stats/?m=main&m2=batting&m3=default&so=WAR&ob=DESC&year=2025&sy=&ey=&te=&po=9&lt=10100&reg=A&pe=&ds=&de=&we=&hr=&ha=&ct=&st=&vp=&bo=&pt=&pp=&ii=&vc=&um=&oo=&rr=&sc=&bc=&ba=&li=&as=&ae=&pl=&gc=&lr=&pr=50&ph=&hs=&us=&na=&ls=&sf1=&sk1=&sv1=&sf2=&sk2=&sv2=",
    "DH": "https://statiz.sporki.com/stats/?m=main&m2=batting&m3=default&so=WAR&ob=DESC&year=2025&sy=&ey=&te=&po=10&lt=10100&reg=A&pe=&ds=&de=&we=&hr=&ha=&ct=&st=&vp=&bo=&pt=&pp=&ii=&vc=&um=&oo=&rr=&sc=&bc=&ba=&li=&as=&ae=&pl=&gc=&lr=&pr=50&ph=&hs=&us=&na=&ls=&sf1=&sk1=&sv1=&sf2=&sk2=&sv2="
}

fielding_urls = {
    "1B": "https://statiz.sporki.com/stats/?m=main&m2=fielding&m3=default&so=WAAwithPOS&ob=DESC&year=2025&sy=&ey=&te=&po=3&lt=10100&reg=A&pe=&ds=&de=&we=&hr=&ha=&ct=&st=&vp=&bo=&pt=&pp=&ii=&vc=&um=&oo=&rr=&sc=&bc=&ba=&li=&as=&ae=&pl=&gc=&lr=&pr=50&ph=&hs=&us=&na=&ls=&sf1=&sk1=&sv1=&sf2=&sk2=&sv2=",
    "2B": "https://statiz.sporki.com/stats/?m=main&m2=fielding&m3=default&so=WAAwithPOS&ob=DESC&year=2025&sy=&ey=&te=&po=4&lt=10100&reg=A&pe=&ds=&de=&we=&hr=&ha=&ct=&st=&vp=&bo=&pt=&pp=&ii=&vc=&um=&oo=&rr=&sc=&bc=&ba=&li=&as=&ae=&pl=&gc=&lr=&pr=50&ph=&hs=&us=&na=&ls=&sf1=&sk1=&sv1=&sf2=&sk2=&sv2=",
    "3B": "https://statiz.sporki.com/stats/?m=main&m2=fielding&m3=default&so=WAAwithPOS&ob=DESC&year=2025&sy=&ey=&te=&po=5&lt=10100&reg=A&pe=&ds=&de=&we=&hr=&ha=&ct=&st=&vp=&bo=&pt=&pp=&ii=&vc=&um=&oo=&rr=&sc=&bc=&ba=&li=&as=&ae=&pl=&gc=&lr=&pr=50&ph=&hs=&us=&na=&ls=&sf1=&sk1=&sv1=&sf2=&sk2=&sv2=",
    "SS": "https://statiz.sporki.com/stats/?m=main&m2=fielding&m3=default&so=WAAwithPOS&ob=DESC&year=2025&sy=&ey=&te=&po=6&lt=10100&reg=A&pe=&ds=&de=&we=&hr=&ha=&ct=&st=&vp=&bo=&pt=&pp=&ii=&vc=&um=&oo=&rr=&sc=&bc=&ba=&li=&as=&ae=&pl=&gc=&lr=&pr=50&ph=&hs=&us=&na=&ls=&sf1=&sk1=&sv1=&sf2=&sk2=&sv2=",
    "C": "https://statiz.sporki.com/stats/?m=main&m2=fielding&m3=default&so=WAAwithPOS&ob=DESC&year=2025&sy=&ey=&te=&po=2&lt=10100&reg=A&pe=&ds=&de=&we=&hr=&ha=&ct=&st=&vp=&bo=&pt=&pp=&ii=&vc=&um=&oo=&rr=&sc=&bc=&ba=&li=&as=&ae=&pl=&gc=&lr=&pr=50&ph=&hs=&us=&na=&ls=&sf1=&sk1=&sv1=&sf2=&sk2=&sv2=",
    "LF": "https://statiz.sporki.com/stats/?m=main&m2=fielding&m3=default&so=WAAwithPOS&ob=DESC&year=2025&sy=&ey=&te=&po=7&lt=10100&reg=A&pe=&ds=&de=&we=&hr=&ha=&ct=&st=&vp=&bo=&pt=&pp=&ii=&vc=&um=&oo=&rr=&sc=&bc=&ba=&li=&as=&ae=&pl=&gc=&lr=&pr=50&ph=&hs=&us=&na=&ls=&sf1=&sk1=&sv1=&sf2=&sk2=&sv2=",
    "CF": "https://statiz.sporki.com/stats/?m=main&m2=fielding&m3=default&so=WAAwithPOS&ob=DESC&year=2025&sy=&ey=&te=&po=8&lt=10100&reg=A&pe=&ds=&de=&we=&hr=&ha=&ct=&st=&vp=&bo=&pt=&pp=&ii=&vc=&um=&oo=&rr=&sc=&bc=&ba=&li=&as=&ae=&pl=&gc=&lr=&pr=50&ph=&hs=&us=&na=&ls=&sf1=&sk1=&sv1=&sf2=&sk2=&sv2=",
    "RF": "https://statiz.sporki.com/stats/?m=main&m2=fielding&m3=default&so=WAAwithPOS&ob=DESC&year=2025&sy=&ey=&te=&po=9&lt=10100&reg=A&pe=&ds=&de=&we=&hr=&ha=&ct=&st=&vp=&bo=&pt=&pp=&ii=&vc=&um=&oo=&rr=&sc=&bc=&ba=&li=&as=&ae=&pl=&gc=&lr=&pr=50&ph=&hs=&us=&na=&ls=&sf1=&sk1=&sv1=&sf2=&sk2=&sv2="
}

pitching_url = "https://statiz.sporki.com/stats/?m=main&m2=pitching&m3=default&so=WAR&ob=DESC&year=2025&sy=&ey=&te=&po=&lt=10100&reg=A&pe=&ds=&de=&we=&hr=&ha=&ct=&st=&vp=&bo=&pt=&pp=&ii=&vc=&um=&oo=&rr=&sc=&bc=&ba=&li=&as=&ae=&pl=&gc=&lr=&pr=50&ph=&hs=&us=&na=&ls=&sf1=&sk1=&sv1=&sf2=&sk2=&sv2="

batting_columns = ["Rank", "Name", "Team", "WAR", "G", "PA", "AB", "R", "H", "2B", "3B", "HR", "TB", "RBI", "SB", "CS", "BB", "HBP", "SO", "AVG", "OBP"]
pitching_columns = ["Rank", "Name", "Team", "WAR", "G", "W", "L", "ERA", "IP", "SO", "SV", "HLD"]
fielding_columns = ["Rank", "Name", "Team", "WAR", "G", "Inn", "dWAR", "E", "A", "PO", "DP"]

df_pitching = extract_table_data(pitching_url, pitching_columns, 12)

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="mingu10133*",
    database="dugoutdb"
)
cursor = conn.cursor()

# === Batters ===
for pos, url in batting_urls.items():
    df_batting = extract_table_data(url, batting_columns, 21)
    create_batter_table_if_not_exists(pos, cursor)
    for _, row in df_batting.iterrows():
        try:
            war = float(row["WAR"])
            pa = int(float(row["PA"]))
            ab = int(float(row["AB"]))
            hr = int(row["HR"])
            rbi = int(row["RBI"])
            score = hr * 6 + rbi * 1.2 + war * 12
            cursor.execute(f"""
                INSERT INTO batters_{pos} (name, team, war, pa, ab, hr, rbi, battingScore)
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
            """, (row["Name"], row["Team"], war, pa, ab, hr, rbi, score))
        except Exception as e:
            print(f"[Batters {pos} ERROR] {row['Name']} - {e}")

# === Pitchers ===
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
    hld INT,
    pitcherScore FLOAT
);
""")
cursor.execute("DELETE FROM pitchers")
for _, row in df_pitching.iterrows():
    try:
        war = float(row["WAR"])
        w = int(row["W"])
        sv = int(row["SV"])
        hld = int(row["HLD"])
        era = float(row["ERA"])
        g = int(row["G"])
        l = int(row["L"])
        ip = float(row["IP"])
        so = int(row["SO"])
        score = war * 10 + w * 2 + sv * 1.5 + hld * 1.5 - era
        cursor.execute("""
            INSERT INTO pitchers (name, team, war, g, w, l, era, ip, so, sv, hld, pitcherScore)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """, (
            row["Name"], row["Team"], war, g, w, l, era, ip, so, sv, hld, score
        ))
    except Exception as e:
        print(f"[Pitchers ERROR] {row['Name']} - {e}")
        continue

# === Fielders ===
for pos, url in fielding_urls.items():
    df_fielding = extract_table_data(url, fielding_columns, 11)
    create_fielder_table_if_not_exists(pos, cursor)
    for _, row in df_fielding.iterrows():
        try:
            war = float(row["WAR"]) if row["WAR"] != '' else 0.0
            g = int(row["G"]) if row["G"] != '' else 0
            inn = float(row["Inn"]) if row["Inn"] != '' else 0.0
            dwar = float(row["dWAR"]) if row["dWAR"] != '' else 0.0
            err = int(row["E"]) if row["E"] != '' else 0
            assists = int(row["A"]) if row["A"] != '' else 0
            po = int(row["PO"]) if row["PO"] != '' else 0
            dp = int(row["DP"]) if row["DP"] != '' else 0
            score = dwar- err * 1 + assists * 0.05 + po * 0.05
            cursor.execute(f"""
                INSERT INTO fielders_{pos} (name, team, war, g, inn, dwar, err, assists, putouts, dp, fieldingScore)
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
            """, (
                row["Name"], row["Team"], war, g, inn,
                dwar, err, assists, po, dp, score
            ))
        except Exception as e:
            print(f"[Fielders {pos} ERROR] {row['Name']} - {e}")

conn.commit()
cursor.close()
conn.close()
print("All data with scores saved successfully.")