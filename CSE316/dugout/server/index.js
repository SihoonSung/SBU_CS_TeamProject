const express = require("express");
const cors = require("cors");

const app = express();
const port = 3001;

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
                imageUrl: user.image_url || "/Images/user.png"
            }
        });
    }catch(error){
        console.error("Login error:", error);
        res.status(500).json({ message:"Server error" });
    }
});

app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});