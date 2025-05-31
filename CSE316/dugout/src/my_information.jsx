import React, { useState } from 'react';
import './my_information.css';
import { hashutil } from './hashutil/javascript/Hashutil';

function MyInformation({ userProfile, setUserProfile }) {
    const [showImageModal, setShowImageModal] = useState(false);
    const [showPwModal, setShowPwModal] = useState(false);
    const [showNameModal, setShowNameModal] = useState(false);
    const [newName, setNewName] = useState('');
    const [newPassword, setNewPassword] = useState('');
    const [newImage, setNewImage] = useState(null);

    const closeAllModals = () => {
        setShowImageModal(false);
        setShowPwModal(false);
        setShowNameModal(false);
        setNewName('');
        setNewPassword('');
        setNewImage(null);
    };

    const email = userProfile?.email || "abc@google.com";
    const name = userProfile?.username || "John Doe";
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
                alert("update image");
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

    const handleName = async() => {
        try{
            const response = await fetch("http://localhost:3001/api/update-name", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({
                    email: userProfile.email,
                    newName: newName
                })
            });
            if (!response.ok) throw new Error("Request failed");
            const result = await response.json();
            if (result.success) {
                alert("Updated name.");
                setUserProfile(prev => ({ ...prev, username: newName }));
                closeAllModals();
            } else {
                alert("Name update failed.");
            }
        }catch(err){
            console.error("Name update error:", err);
            alert("Server error.");
        }
    };

    const handlePassword = async() => {
        try{
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
            if(result.success){
                alert("Updated password.");
                closeAllModals();
            }else{
                alert("Password update failed.");
            }
        }catch(err){
            alert("Server error");
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
            </ul>
            {showImageModal && (
                <>
                <div className="overlay" onClick={closeAllModals}></div>
                <div className="modal">
                    <div className="header">
                    <h3>Change your image</h3>
                    <span className="exit" onClick={closeAllModals}>
                        <svg xmlns="http://www.w3.org/2000/svg" height="25px" viewBox="0 -960 960 960" width="25px" fill="#1f1f1f">
                            <path d="m256-200-56-56 224-224-224-224 56-56 224 224 224-224 56 56-224 224 224 224-56 56-224-224-224 224Z"/>
                        </svg>
                    </span>
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

            {showPwModal && (
                <>
                <div className="overlay" onClick={closeAllModals}></div>
                <div className="modal">
                    <div className="header">
                    <h3>Change your password</h3>
                    <span className="exit" onClick={closeAllModals}>
                        <svg xmlns="http://www.w3.org/2000/svg" height="25px" viewBox="0 -960 960 960" width="25px" fill="#1f1f1f">
                            <path d="m256-200-56-56 224-224-224-224 56-56 224 224 224-224 56 56-224 224 224 224-56 56-224-224-224 224Z"/>
                        </svg>
                    </span>
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
            {showNameModal && (
                <>
                <div className="overlay" onClick={closeAllModals}></div>
                <div className="modal">
                    <div className="header">
                    <h3>Change your name</h3>
                    <span className="exit" onClick={closeAllModals}>
                        <svg xmlns="http://www.w3.org/2000/svg" height="25px" viewBox="0 -960 960 960" width="25px" fill="#1f1f1f">
                            <path d="m256-200-56-56 224-224-224-224 56-56 224 224 224-224 56 56-224 224 224 224-56 56-224-224-224 224Z"/>
                        </svg>
                    </span>
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
        </div>
    );
}

export default MyInformation;
