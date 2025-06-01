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
    const userEmail = req.query.email || "";
    try {
        const [posts] = await pool.query(`
            SELECT p.*, 
                    EXISTS(
                        SELECT 1 FROM post_likes pl 
                        WHERE pl.post_id = p.id AND pl.user_email = ?
                    ) AS likedByUser
            FROM posts p
            ORDER BY p.id DESC
        `, [userEmail]);
        res.status(200).json(posts);
    } catch (err) {
        console.error("Fetch posts error:", err);
        res.status(500).json({ message: "Server error." });
    }
});

const fetchPosts = async () => {
    try {
        const email = userProfile?.email || "";
        const response = await fetch(`http://localhost:3001/api/posts?email=${email}`);
        const data = await response.json();
        setPosts(data);
    } catch (error) {
        console.error("Fetch error:", error);
    }
};

app.delete("/api/posts/:id", async (req, res) => {
    const { id } = req.params;
    try {
        const [result] = await pool.query("DELETE FROM posts WHERE id = ?", [id]);
        if (result.affectedRows === 0) {
        return res.status(404).json({ message: "Post not found." });
        }
        res.status(200).json({ message: "Post deleted." });
    } catch (err) {
        console.error("Delete error:", err);
        res.status(500).json({ message: "Server error." });
    }
});

app.post("/api/posts/:id/like", async (req, res) => {
    const { id } = req.params;
    const { email } = req.body;
    try {
        const [existing] = await pool.query(
            "SELECT * FROM post_likes WHERE post_id = ? AND user_email = ?",
            [id, email]
        );
        if (existing.length > 0) {
            await pool.query("DELETE FROM post_likes WHERE post_id = ? AND user_email = ?", [id, email]);
            await pool.query("UPDATE posts SET likes = likes - 1 WHERE id = ?", [id]);
            return res.status(200).json({ liked: false });
        } else {
            await pool.query("INSERT INTO post_likes (post_id, user_email) VALUES (?, ?)", [id, email]);
            await pool.query("UPDATE posts SET likes = likes + 1 WHERE id = ?", [id]);
            return res.status(200).json({ liked: true });
        }
    } catch (err) {
        console.error("Toggle like error:", err);
        res.status(500).json({ message: "Server error." });
    }
});

app.post("/api/posts/:id/comments", async (req, res) => {
    const { id } = req.params;
    const { author, content } = req.body;
    try {
        await pool.query("INSERT INTO comments (post_id, author, content, time) VALUES (?, ?, ?, NOW())", [id, author, content]);
        res.status(201).json({ message: "Comment added." });
    } catch (err) {
        console.error("Comment add error:", err);
        res.status(500).json({ message: "Server error." });
    }
});

app.post("/api/posts/:id/comments/delete", async (req, res) => {
    const { id } = req.params;
    const { author, content } = req.body;
    try {
        const [existing] = await pool.query(
            "SELECT * FROM comments WHERE post_id = ? AND content = ? AND author = ?",
            [id, content, author]
        );
        if (existing.length === 0) {
            return res.status(403).json({ message: "You cannot delete this comment." });
        }
        await pool.query(
            "DELETE FROM comments WHERE post_id = ? AND content = ? AND author = ?",
            [id, content, author]
        );
        res.status(200).json({ message: "Comment deleted." });
    } catch (err) {
        console.error("Delete comment error:", err);
        res.status(500).json({ message: "Server error." });
    }
});

app.get("/api/posts/:id/comments", async (req, res) => {
    const { id } = req.params;
    try {
        const [comments] = await pool.query("SELECT author, content, time FROM comments WHERE post_id = ? ORDER BY id ASC", [id]);
        res.status(200).json(comments);
    } catch (err) {
        console.error("Fetch comments error:", err);
        res.status(500).json({ message: "Server error." });
    }
});

app.get('/api/players', async (req, res) => {
    const type = req.query.type || 'batting';
    let tableName;
    if (type === 'batting') tableName = 'batters';
    else if (type === 'pitching') tableName = 'pitchers';
    else if (type === 'fielding') tableName = 'defenders';
    else return res.status(400).json({ message: "Invalid type parameter" });
    try {
        const [rows] = await pool.query(`SELECT * FROM ${tableName}`);
        res.json(rows);
    } catch (error) {
        console.error("Error fetching players:", error);
        res.status(500).json({ message: "Database error." });
    }
});

app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});