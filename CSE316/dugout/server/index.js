const express = require("express");
const cors = require("cors");
const mysql = require("mysql2/promise");
const multer = require("multer");
const path = require("path");

const app = express();
const upload = multer({ dest: "uploads/" });
const port = 3001;

const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: 'mingu10133*',
    database: 'dugoutdb'
});

app.use(cors());
app.use(express.json());

app.post("/api/signup", async(req, res) => {
    const { email, username, password, team } = req.body;
    if(!email || !username || !password || !team){
        return res.status(400).json({ message: "Missing required fields." });
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

app.post('/api/update-name', async(req, res) => {
    const{ email, newName } = req.body;
    try{
        const [result] = await pool.query("UPDATE users SET username = ? WHERE email = ?", [newName, email]);
        console.log("Query result:", result);
        res.json({ success: result.affectedRows > 0 || result.changedRows === 0 });
    }catch(error){
        console.error("Name update error:", error);
        res.status(500).json({ success: false });
    }
});

app.post('/api/update-password', async(req, res) => {
    const { email, newPassword } = req.body;
    try{
        const [result] = await pool.query("UPDATE users SET password = ? WHERE email = ?", [newPassword, email]);
        res.json({ success: result.affectedRows > 0 });
    }catch(error){
        console.error("Password update error:", error);
        res.status(500).json({ success: false });
    }
});

app.use("/uploads", express.static("uploads"));
app.post("/api/update-image", upload.single("image"), async (req, res) => {
    const { email } = req.body;
    const imageUrl = `/uploads/${req.file?.filename}`;
    if (!req.file) {
        console.error("No file uploaded.");
        return res.status(400).json({ success: false, message: "No file uploaded." });
    }
    try{
        await pool.query("UPDATE users SET image_url = ? WHERE email = ?", [imageUrl, email]);
        res.json({ success: true, imageUrl });
    }catch(error){
        console.error("Image update error:", error);
        res.status(500).json({ success: false });
    }
});

app.post("/api/posts", async (req, res) => {
    const { title, content, author } = req.body;
    try {
        await pool.query("INSERT INTO posts (title, content, author, time) VALUES (?, ?, ?, NOW())", [title, content, author]);
        res.status(201).json({ message: "Post created successfully." });
    } catch (err) {
        console.error("Post creation error:", err);
        res.status(500).json({ message: "Server error." });
    }
});

app.get("/api/posts", async (req, res) => {
    try {
        const [posts] = await pool.query("SELECT * FROM posts ORDER BY id DESC");
        res.status(200).json(posts);
    } catch (err) {
        console.error("Fetch posts error:", err);
        res.status(500).json({ message: "Server error." });
    }
});

app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});