import React, { useState } from 'react';
import './my_information.css';
import { hashutil } from './hashutil/javascript/Hashutil';

function MyInformation({ userProfile, setUserProfile }) {
    const [showImageModal, setShowImageModal] = useState(false);
    const [showPwModal, setShowPwModal] = useState(false);
    const [showNameModal, setShowNameModal] = useState(false);
    const [showTeamModal, setShowTeamModal] = useState(false);

    const [newName, setNewName] = useState('');
    const [newPassword, setNewPassword] = useState('');
    const [newImage, setNewImage] = useState(null);
    const [newTeam, setNewTeam] = useState('');

    const closeAllModals = () => {
        setShowImageModal(false);
        setShowPwModal(false);
        setShowNameModal(false);
        setShowTeamModal(false);
        setNewName('');
        setNewPassword('');
        setNewImage(null);
        setNewTeam('');
    };

    const email = userProfile?.email || "abc@google.com";
    const name = userProfile?.username || "John Doe";
    const team = userProfile?.team || "No Team";
    const password = "******";

    const handleImage = async () => {
        if (!newImage){
            alert("Please select an image file.");
            return;
        }
        const formData = new FormData();
        formData.append("email", userProfile.email);
        formData.append("image", newImage);
        try{
            const response = await fetch("http://localhost:3001/api/update-image", {
                method: "POST", 
                body: formData,
            });
            const result = await response.json();
            if(result.success){
                alert("Image updated.");
                setUserProfile(prev => ({
                    ...prev,
                    imageUrl: result.imageUrl,
                }));
                closeAllModals();
            }else{
                alert("Failed image update.");
            }
        }catch(err){
            console.error("Image update error:", err);
            alert("Server error.");
        }
    };

    const handleName = async () => {
        try {
            const response = await fetch("http://localhost:3001/api/update-name", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({
                    email: userProfile.email,
                    newName: newName
                })
            });
            const result = await response.json();
            if (result.success) {
                alert("Updated name.");
                setUserProfile(prev => ({ ...prev, username: newName }));
                closeAllModals();
            } else {
                alert("Name update failed.");
            }
        } catch (err) {
            console.error("Name update error:", err);
            alert("Server error.");
        }
    };

    const handlePassword = async () => {
        try {
            const hashedPW = hashutil(userProfile.email, newPassword);
            const response = await fetch("http://localhost:3001/api/update-password", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({
                    email: userProfile.email,
                    newPassword: hashedPW
                })
            });
            const result = await response.json();
            if (result.success) {
                alert("Updated password.");
                closeAllModals();
            } else {
                alert("Password update failed.");
            }
        } catch (err) {
            alert("Server error");
        }
    };

    const handleTeam = async () => {
        try {
            const response = await fetch("http://localhost:3001/api/update-team", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({
                    email: userProfile.email,
                    newTeam: newTeam
                })
            });
            const result = await response.json();
            if (result.success) {
                alert("Team updated.");
                setUserProfile(prev => ({ ...prev, team: newTeam }));
                closeAllModals();
            } else {
                alert("Team update failed.");
            }
        } catch (err) {
            console.error("Team update error:", err);
            alert("Server error.");
        }
    };

    return (
        <div className="info">
            <h1>User Information</h1>
            <ul className="information">
                <li>
                    <img 
                        className="profile-image"
                        src={
                            userProfile?.imageUrl &&
                            userProfile.imageUrl !== "null" &&
                            userProfile.imageUrl !== ""
                                ? `http://localhost:3001${userProfile.imageUrl}?t=${Date.now()}`
                                : "/Images/user.png" 
                        }
                        alt="User Profile" 
                        width="150"
                        onError={(e) => { e.target.src = "/Images/user.png"; }}
                    />
                </li>
                <li><button className="change_image" onClick={() => setShowImageModal(true)}>Change Image</button></li>
                <li>Email: {email}</li>
                <li>
                    Password: {password}
                    <button className="change_pw" onClick={() => setShowPwModal(true)}>Change Password</button>
                </li>
                <li>
                    Name: {name}
                    <button className="change_name" onClick={() => setShowNameModal(true)}>Change Name</button>
                </li>
                <li>
                    Team: {team}
                    <button className="change_team" onClick={() => setShowTeamModal(true)}>Change Team</button>
                </li>
            </ul>

            {/* Image Modal */}
            {showImageModal && (
                <>
                <div className="overlay" onClick={closeAllModals}></div>
                <div className="modal">
                    <div className="header">
                        <h3>Change your image</h3>
                        <span className="exit" onClick={closeAllModals}>×</span>
                    </div>
                    <div className="modal-body">
                        <h4>New Image</h4>
                        <input type="file" onChange={(e) => setNewImage(e.target.files[0])} />
                    </div>
                    <div className="buttons">
                        <button className="close" onClick={closeAllModals}>Close</button>
                        <button className="save" onClick={handleImage}>Save changes</button>
                    </div>
                </div>
                </>
            )}

            {/* Password Modal */}
            {showPwModal && (
                <>
                <div className="overlay" onClick={closeAllModals}></div>
                <div className="modal">
                    <div className="header">
                        <h3>Change your password</h3>
                        <span className="exit" onClick={closeAllModals}>×</span>
                    </div>
                    <div className="modal-body">
                        <h4>New Password</h4>
                        <input type="password" value={newPassword} onChange={(e) => setNewPassword(e.target.value)} placeholder="Enter the new password" />
                    </div>
                    <div className="buttons">
                        <button className="close" onClick={closeAllModals}>Close</button>
                        <button className="save" onClick={handlePassword}>Save changes</button>
                    </div>
                </div>
                </>
            )}

            {/* Name Modal */}
            {showNameModal && (
                <>
                <div className="overlay" onClick={closeAllModals}></div>
                <div className="modal">
                    <div className="header">
                        <h3>Change your name</h3>
                        <span className="exit" onClick={closeAllModals}>×</span>
                    </div>
                    <div className="modal-body">
                        <h4>New Name</h4>
                        <input type="text" value={newName} onChange={(e) => setNewName(e.target.value)} placeholder="Enter the new name" />
                    </div>
                    <div className="buttons">
                        <button className="close" onClick={closeAllModals}>Close</button>
                        <button className="save" onClick={handleName}>Save changes</button>
                    </div>
                </div>
                </>
            )}

            {/* Team Modal */}
            {showTeamModal && (
                <>
                <div className="overlay" onClick={closeAllModals}></div>
                <div className="modal">
                    <div className="header">
                        <h3>Change your team</h3>
                        <span className="exit" onClick={closeAllModals}>×</span>
                    </div>
                    <div className="modal-body">
                        <h4>Select New Team</h4>
                        <select value={newTeam} onChange={(e) => setNewTeam(e.target.value)}>
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
                    </div>
                    <div className="buttons">
                        <button className="close" onClick={closeAllModals}>Close</button>
                        <button className="save" onClick={handleTeam}>Save changes</button>
                    </div>
                </div>
                </>
            )}
        </div>
    );
}

export default MyInformation;