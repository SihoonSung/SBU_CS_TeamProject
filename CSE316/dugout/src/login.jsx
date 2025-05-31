import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { hashutil } from './hashutil/javascript/Hashutil';
import "./login.css";

function Login({ setLoggedIn, setUserProfile, loggedIn }) {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const navigate = useNavigate();

    const handleSignIn = async () => {
        if(loggedIn){
            alert("You are already logged in.");
            return;
        }
        if(!email || !password){
            alert("Please enter both email and password.");
            return;
        }
        const hashedPW = hashutil(email, password);
        try{
            const response = await fetch("http://localhost:3001/api/login", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({
                    email: email,
                    password: hashedPW
                })
            });
            if(response.ok){
                const result = await response.json();
                setLoggedIn(true);
                setUserProfile(result.user);
                navigate("/");
            } else {
                const error = await response.json();
                alert(error.message || "Login failed");
            }
        } catch(error){
            console.error("Login error", error);
            alert("Server error. Please try again later.");
        }
    };

    const handleSignUp = () => {
        navigate("/signup");
    };

    return (
        <div className="sign-container">
            <h1>Sign in</h1>
            <div className="sign-form">
                <label>E-mail</label>
                <input 
                    type="text" 
                    value={email} 
                    onChange={(e) => setEmail(e.target.value)}
                    placeholder="123456789"
                />
                <label>Password</label>
                <input
                    type="password"
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                    placeholder="******"
                />
                <div className="sign-buttons">
                    <button className="signin-button" onClick={handleSignIn}>Sign in</button>
                    <button className="signup-button" onClick={handleSignUp}>Sign up</button>
                </div>
            </div>
        </div>
    )
}

export default Login;