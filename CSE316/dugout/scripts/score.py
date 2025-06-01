from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from bs4 import BeautifulSoup
from datetime import datetime

# ChromeDriver 설정
service = Service("/opt/homebrew/bin/chromedriver")
options = Options()
# options.add_argument("--headless")  # 디버깅 중이면 주석 처리
options.add_argument("--no-sandbox")
options.add_argument("--disable-dev-shm-usage")

driver = webdriver.Chrome(service=service, options=options)

# 오늘 날짜
today = datetime.now().strftime("%Y-%m-%d")
url = f"https://m.sports.naver.com/kbaseball/schedule/index?date={today}"
driver.get(url)

# ✅ 경기 정보 로딩 기다리기
try:
    WebDriverWait(driver, 10).until(
        EC.presence_of_all_elements_located((By.CSS_SELECTOR, "ul.ScheduleAllType_match_list__3n5L_ > li"))
    )
except:
    print("❌ 경기를 불러오지 못했습니다.")
    driver.quit()
    exit()

# BeautifulSoup로 파싱
soup = BeautifulSoup(driver.page_source, "html.parser")
driver.quit()

# ...

# 경기 정보 가져오기
matches = soup.select("ul.ScheduleAllType_match_list__3n5L_ > li")

valid_matches = []
for match in matches:
    teams = match.select("strong.MatchBoxHeadToHeadArea_team__40JQL")
    scores = match.select("strong.MatchBoxHeadToHeadArea_score__e2D7k")
    status = match.select_one("em.MatchBox_status__2pbzi")
    stadium = match.select_one("div.MatchBox_stadium__13gft")

    # ✅ 두 팀이 모두 존재할 때만 유효한 경기로 간주
    if len(teams) == 2 and len(scores) == 2:
        valid_matches.append({
            "team1": teams[0].get_text(strip=True),
            "team2": teams[1].get_text(strip=True),
            "score1": scores[0].get_text(strip=True),
            "score2": scores[1].get_text(strip=True),
            "status": status.get_text(strip=True) if status else "",
            "stadium": stadium.get_text(strip=True) if stadium else ""
        })

# 출력
if not valid_matches:
    print("❌ 오늘 경기 없음")
else:
    print(f"✅ 오늘 경기 수: {len(valid_matches)}\n")

    for match in valid_matches:
        print(f"📌 {match['team1']} {match['score1']} vs {match['score2']} {match['team2']} - {match['status']} @ {match['stadium']}")