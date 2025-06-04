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

Due to the GitHub error, we put the venv file into the .gitignore file.
So I think you should install it.
So the first step is to make sure that pip is working properly, and make sure that your python version is 3.9 with these commands. 
python3.9 -m ensurepip --upgrade
python3.9 -m pip install --upgrade pip

Then, you have to make a new virtual environment.
python3.9 -m venv venv 
source venv/bin/activate

Then, please install the needed packages. 
pip install flask flask-cors requests beautifulsoup4 selenium pymysql python-dotenv mysql-connector-python pandas

Then you will be able to run the server with this command. 
export FLASK_APP=score.py flask run --host=0.0.0.0 --port=5001
If you have another problem, then please let me know. 
Thank you!

