const express = require("express");
const cors = require("cors");
const mysql = require("mysql2/promise");

const app = express();
const port = 3001;

const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: 'mingu10133*',
  database: 'dugoutdb'
});

app.use(cors());
app.use(express.json());

app.post("/api/login", async(req, res) => {
    const{ email, password } = req.body;
    try{
        const [users] = await pool.query("SELECT * FROM users WHERE email = ?", [email]);
        if(users.length === 0){
            return res.status(401).json({ message: "Wrong Email or wrong password." });
        }
        const user = users[0];
        if(user.password !== password){
            return res.status(401).json({ message: "Wrong Email or wrong password." });
        }
        res.status(200).json({ 
            message: "Login successful",
            user: {
                email: user.email,
                username: user.username,
                password: user.password,
                team: user.team,
                imageUrl: user.image_url || "/Images/user.png"
            }
        });
    }catch(error){
        console.error("Login error:", error);
        res.status(500).json({ message:"Server error" });
    }
});

app.post("/api/signup", async(req, res) => {
  const { email, username, password, team } = req.body;
  if(!email || !username || !password || !team){
    return res.status(400).json({ meesage: "Missing required fields." });
  }
  try{
    const [existing] = await pool.query("SELECT * FROM users WHERE email = ?", [email]);
      if (existing.length > 0) {
          return res.status(409).json({ message: "Email already registered." });
      }
      await pool.query(
        "INSERT INTO users (email, username, password, team) VALUES (?, ?, ?, ?)",
        [email, username, password, team]
      );
      res.status(201).json({ message: "User registered successfully." });
  }catch (err) {
    console.error("Signup error:", err);
    res.status(500).json({ message: "Server error." });
  }
})

app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});