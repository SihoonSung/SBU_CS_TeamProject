# score.py
from flask import Flask, Response
from selenium import webdriver
from flask_cors import CORS

from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from bs4 import BeautifulSoup
from datetime import datetime, timedelta
import json
import time
import requests

app = Flask(__name__)
CORS(app)

team_name_map = {
    "두산": "Doosan Bears",
    "키움": "Kiwoom Heroes",
    "한화": "Hanwha Eagles",
    "NC": "NC Dinos",
    "삼성": "Samsung Lions",
    "LG": "LG Twins",
    "KIA": "KIA Tigers",
    "KT": "KT Wiz",
    "SSG": "SSG Landers",
    "롯데": "Lotte Giants"
}

def create_driver():
    chrome_options = Options()
    chrome_options.add_argument("--headless")
    chrome_options.add_argument("--no-sandbox")
    chrome_options.add_argument("--disable-dev-shm-usage")
    service = Service("/opt/homebrew/bin/chromedriver") 
    return webdriver.Chrome(service=service, options=chrome_options)

def crawl_scores_for_date(date_str):
    driver = create_driver()
    url = f"https://m.sports.naver.com/kbaseball/schedule/index?date={date_str}"
    driver.get(url)
    time.sleep(2)

    soup = BeautifulSoup(driver.page_source, "html.parser")
    driver.quit()

    match_boxes = soup.select(".MatchBox_match_item__3_D0Q")
    results = []
    for match in match_boxes:
        teams = match.select(".MatchBoxHeadToHeadArea_team__40JQL")
        scores = match.select(".MatchBoxHeadToHeadArea_score__e2D7k")
        status_tag = match.select_one(".MatchBox_status__2pbzi")
        stadium_tag = match.select_one(".MatchBox_stadium__13gft")

        if len(teams) == 2:
            team1_kor = teams[0].text.strip()
            team2_kor = teams[1].text.strip()
            result = {
                "team1": team_name_map.get(team1_kor, team1_kor),
                "score1": scores[0].text.strip() if len(scores) == 2 else "",
                "team2": team_name_map.get(team2_kor, team2_kor),
                "score2": scores[1].text.strip() if len(scores) == 2 else "",
                "status": status_tag.text.strip() if status_tag else "",
                "stadium": stadium_tag.text.strip() if stadium_tag else ""
            }
            results.append(result)

    return results

@app.route('/live-scores')
def get_live_scores():
    today = datetime.today().strftime('%Y-%m-%d')
    results = crawl_scores_for_date(today)
    return Response(json.dumps(results, ensure_ascii=False), content_type="application/json")

@app.route('/weekly-schedule')
def get_weekly_schedule():
    today = datetime.today()
    weekday = today.weekday()
    start_date = today - timedelta(days=(weekday - 1)) 

    week_results = []
    for i in range(6): 
        date = start_date + timedelta(days=i)
        date_str = date.strftime('%Y-%m-%d')
        games = crawl_scores_for_date(date_str)
        week_results.append({
            "date": date_str,
            "games": games
        })

    return Response(json.dumps(week_results, ensure_ascii=False), content_type="application/json")

@app.route('/team-rankings')
def team_rankings():
    import requests
    from bs4 import BeautifulSoup

    url = "https://www.koreabaseball.com/Record/TeamRank/TeamRankDaily.aspx"
    headers = {
        "User-Agent": "Mozilla/5.0"
    }

    res = requests.get(url, headers=headers)
    soup = BeautifulSoup(res.text, "html.parser")
    table = soup.select_one("table.tData")

    results = []
    if not table:
        return Response(json.dumps(results, ensure_ascii=False), content_type="application/json")

    rows = table.select("tbody tr")

    for i, row in enumerate(rows, 1):
        cols = row.select("td")
        if len(cols) >= 10:
            name_kor = cols[1].text.strip()
            games_behind = cols[7].text.strip()
            logo_src = f"/images/logos/{team_name_map.get(name_kor, name_kor).lower().replace(' ', '_')}.png"

            results.append({
                "rank": i,
                "name": team_name_map.get(name_kor, name_kor),
                "logoUrl": logo_src,
                "gap": games_behind
            })

    return Response(json.dumps(results, ensure_ascii=False), content_type="application/json")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5001)