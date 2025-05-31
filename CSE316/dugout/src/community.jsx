import React, { useState, useEffect } from 'react';
import './community.css';

function Community({ loggedIn, userProfile }) {
    const [showForm, setShowForm] = useState(false);
    const [posts, setPosts] = useState([]);
    const [title, setTitle] = useState('');
    const [content, setContent] = useState('');

    const fetchPosts = async () => {
        try {
            const response = await fetch("http://localhost:3001/api/posts");
            const data = await response.json();
            setPosts(data);
        } catch (error) {
            console.error("Fetch error:", error);
        }
    };

    useEffect(() => {
        fetchPosts();
    }, []);

    const handleWriteClick = () => {
        setShowForm(true);
    };

    const handleCancel = () => {
        setShowForm(false);
        setTitle('');
        setContent('');
    };

    const handleSubmit = async () => {
        if (!loggedIn) {
            alert("Please Login first.");
            return;
        }
        if (!title.trim()) {
            alert("Please enter a title.");
            return;
        }

        try {
            const response = await fetch("http://localhost:3001/api/posts", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({
                title,
                content,
                author: userProfile?.username || "Anonymous",
            }),
            });

            if (response.ok) {
            fetchPosts();
            setShowForm(false);
            setTitle('');
            setContent('');
            } else {
            alert("Failed to create post.");
            }
        } catch (error) {
            console.error("Post error:", error);
            alert("Server error.");
        }
    };

    const handleDelete = async (id, author) => {
        if (author !== userProfile?.username) {
            alert("You cannot delete.");
            return;
        }

        try {
            const response = await fetch(`http://localhost:3001/api/posts/${id}`, {
            method: "DELETE",
            });

            if (response.ok) {
            fetchPosts(); // 서버에서 다시 받아와 반영
            } else {
            alert("Failed to delete post.");
            }
        } catch (error) {
            console.error("Delete error:", error);
            alert("Server error.");
        }
    };

    return (
        <div className="community-container">
            <h1 className="title">Dugout Community</h1>

            {!showForm && (
                <div className="write-box">
                <button className="write-btn" onClick={handleWriteClick}>Write</button>
                </div>
            )}

            {showForm && (
                <div className="write-form">
                    <div className="cancel-btn" onClick={handleCancel}>
                        <svg xmlns="http://www.w3.org/2000/svg" height="25px" viewBox="0 -960 960 960" width="25px" fill="#1f1f1f">
                            <path d="m256-200-56-56 224-224-224-224 56-56 224 224 224-224 56 56-224 224 224 224-56 56-224-224-224 224Z"/>
                        </svg>
                    </div>
                    <h2>Please enter the title.</h2>
                    <input
                        type="text"
                        value={title}
                        placeholder="Enter title"
                        onChange={(e) => setTitle(e.target.value)}
                    />
                    <textarea
                        value={content}
                        placeholder="Freely talk your opinion with Dugouters!#BaseballChat #KBO"
                        onChange={(e) => setContent(e.target.value)}
                    />
                    <button className="done-btn" onClick={handleSubmit}>Done</button>
                </div>
            )}

            <div className="post-list">
                {posts.map((post) => (
                    <div key={post.id} className="post">
                        <div className="post-header">
                            <div className="delete-btn" onClick={() => handleDelete(post.id, post.author)}>
                                <svg xmlns="http://www.w3.org/2000/svg" height="25px" viewBox="0 -960 960 960" width="25px" fill="#1f1f1f">
                                    <path d="m256-200-56-56 224-224-224-224 56-56 224 224 224-224 56 56-224 224 224 224-56 56-224-224-224 224Z"/>
                                </svg>
                            </div>
                            <p><strong>{post.author}</strong> - {post.time}</p>
                        </div>
                        <h3>{post.title}</h3>
                        <p>{post.content}</p>
                    </div>
                ))}
            </div>
        </div>
    );
}

export default Community;