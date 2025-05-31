import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { hashutil } from './hashutil/javascript/Hashutil';
import "./signup.css";

function Signup({ setLoggedIn, setUserProfile }) {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [passwordCheck, setPasswordCheck] = useState('');
    const [username, setUsername] = useState('');
    const [team, setTeam] = useState('');
    const navigate = useNavigate();

    const handleSignup = async () => {
        if(!email || !password || !passwordCheck || !username || !team){
            alert("All fields are required");
            return;
        }
        if(password !== passwordCheck){
            alert("Confirm password is not the same with password.");
            return;
        }
        const hashedPW = hashutil(email, password);
        try{
            const response = await fetch("http://localhost:3001/api/signup", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({
                    email: email,
                    username: username,
                    password: hashedPW
                })
            });
            
            if(response.ok){
                const signupResult = await response.json();
                alert("User registered successfully!");
                const login = await fetch("http://localhost:3001/api/login", {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify({
                        email: email,
                        password: hashedPW
                    })
                });
                if(login.ok){
                    const loginResult = await login.json();
                    setLoggedIn(true);
                    setUserProfile(loginResult.user);
                    navigate("/");
                }else{
                    alert("Login after signup failed");
                }
                setEmail('');
                setPassword('');
                setPasswordCheck('');
                setUsername('');
            }else{
                const error = await response.json();
                alert(error.message || "Sign up failed");
            }
        } catch(error){
            console.error("Error during signup:", error);
            alert("Server error. Please try again later.");
        }

        console.log("Signing up with:");
        console.log("Email:", email);
        console.log("Username:", username);
        console.log("Hashed Password:", hashedPW);
    };

    return(
        <div className="signup-container">
            <h1>Sign up</h1>
            <div className="signup-form">
                <label>E-mail</label>
                <input
                    type="email"
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                    placeholder="mione@mione.org"
                />
                <label>Password</label>
                <input
                    type="password"
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                    placeholder="******"
                />
                <label>Password Check</label>
                <input
                    type="password"
                    value={passwordCheck}
                    onChange={(e) => setPasswordCheck(e.target.value)}
                    placeholder="******"
                />
                <label>User Name</label>
                <input
                    type="text"
                    value={username}
                    onChange={(e) => setUsername(e.target.value)}
                    placeholder="mione"
                />
                <label>Select Team</label>
                <select value={team} onChange={(e) => setTeam(e.target.value)}>
                    <option value="">-- Select your team --</option>
                    <option value="Doosan Bears">Doosan Bears</option>
                    <option value="LG Twins">LG Twins</option>
                    <option value="Samsung Lions">Samsung Lions</option>
                    <option value="Lotte Giants">Lotte Giants</option>
                    <option value="SSG Landers">SSG Landers</option>
                    <option value="Hanwha Eagles">Hanwha Eagles</option>
                    <option value="NC Dinos">NC Dinos</option>
                    <option value="KT Wiz">KT Wiz</option>
                    <option value="KIA Tigers">KIA Tigers</option>
                    <option value="Kiwoom Heroes">Kiwoom Heroes</option>
                </select>
                <button className="signup" onClick={handleSignup}>Sign up</button>
            </div>
        </div>
    );
}

export default Signup;