You have to install these requirements.

npm install
npm install mysql2
npm install crypto-js
npm install react-router-dom
npm install express cors
pip install requests beautifulsoup4 pandas
pip install mysql-connector-python
GOOGLE_API_KEY=AIzaSyB7vqLL9iGNP8wMaMrPI9IAeh0U3ytVkUw
pip install python-dotenv
npm list react react-dom react-router-dom

FLASK_APP=score.py flask run --host=0.0.0.0 --port=5001
source venv/bin/activate
pip install flask
pip install selenium
pip install flask-cors
pip install beautifulsoup4
pip install pymysql
brew install chromedriver
pip install flask flask-cors
pip install selenium
brew install --cask chromedriver
source /Users/minguhwang/Documents/GitHub/SBU_CS_TeamProject/venv/bin/activate
pip install python-dotenv
pip install requests
http://localhost:5001/live-scores

You have to run 3 servers.
First /SBU_CS_TeamProject/CSE316/dugout npm run dev,
second /SBU_CS_TeamProject/CSE316/dugout/server node index.js,
and then /SBU_CS_TeamProject/CSE316/dugout/scripts in here you have to activate 
virtual environment by source venv/bin/activate and then 
FLASK_APP=score.py flask run --host=0.0.0.0 --port=5001

We have to crawl data from the site(NAVER), and it takes some time to show out
Live games, and Schedules part. 

Also, on Mondays it the database does not show since there is no games.
In tuesdays it will show up. 