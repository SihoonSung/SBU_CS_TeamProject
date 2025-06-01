from flask import Flask, Response
from selenium import webdriver
from flask_cors import CORS

from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from bs4 import BeautifulSoup
import json
import time


app = Flask(__name__)
CORS(app) 

# 한글 → 영문 팀명 매핑
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

@app.route('/live-scores')
def get_live_scores():
    chrome_options = Options()
    chrome_options.add_argument("--headless")
    chrome_options.add_argument("--no-sandbox")
    chrome_options.add_argument("--disable-dev-shm-usage")

    service = Service("/opt/homebrew/bin/chromedriver")
    driver = webdriver.Chrome(service=service, options=chrome_options)

    driver.get("https://m.sports.naver.com/kbaseball/schedule/index?date=2025-06-01")
    time.sleep(3)
    html = driver.page_source
    driver.quit()

    soup = BeautifulSoup(html, "html.parser")
    match_boxes = soup.select(".MatchBox_match_item__3_D0Q")

    results = []
    for match in match_boxes:
        teams = match.select(".MatchBoxHeadToHeadArea_team__40JQL")
        scores = match.select(".MatchBoxHeadToHeadArea_score__e2D7k")
        status_tag = match.select_one(".MatchBox_status__2pbzi")
        stadium_tag = match.select_one(".MatchBox_stadium__13gft")

        if len(teams) == 2 and len(scores) == 2:
            team1_kor = teams[0].text.strip()
            team2_kor = teams[1].text.strip()

            result = {
                "team1": team_name_map.get(team1_kor, team1_kor),
                "score1": scores[0].text.strip(),
                "team2": team_name_map.get(team2_kor, team2_kor),
                "score2": scores[1].text.strip(),
                "status": status_tag.text.strip() if status_tag else "",
                "stadium": stadium_tag.text.strip() if stadium_tag else ""
            }
            results.append(result)

    return Response(
        json.dumps(results, ensure_ascii=False),
        content_type="application/json"
    )