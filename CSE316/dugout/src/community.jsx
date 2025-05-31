import React, { useState, useEffect } from 'react';
import './community.css';

function Community({ loggedIn, userProfile }) {
    const [showForm, setShowForm] = useState(false);
    const [posts, setPosts] = useState([]);
    const [title, setTitle] = useState('');
    const [content, setContent] = useState('');
    const [comments, setComments] = useState({});
    const [commentInputs, setCommentInputs] = useState({});

    const fetchPosts = async () => {
        try {
            const email = userProfile?.email || "";
            const response = await fetch("http://localhost:3001/api/posts");
            const data = await response.json();
            setPosts(data);
            await fetchCommentsForAllPosts(data);
        } catch (error) {
            console.error("Fetch error:", error);
        }
    };

    const fetchCommentsForAllPosts = async (postList) => {
        const allComments = {};
        for (const post of postList) {
            try {
                const res = await fetch(`http://localhost:3001/api/posts/${post.id}/comments`);
                const data = await res.json();
                allComments[post.id] = data;
            } catch (error) {
                console.error(`Error fetching comments for post ${post.id}:`, error);
            }
        }
        setComments(allComments);
    };

    useEffect(() => {
        if (userProfile?.email) {
            fetchPosts();
        }
    }, [userProfile?.email]);

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
                fetchPosts();
            } else {
                alert("Failed to delete post.");
            }
        } catch (error) {
            console.error("Delete error:", error);
            alert("Server error.");
        }
    };

    const handleLike = async (postId) => {
        if (!userProfile?.email) {
            alert("Please login to like posts.");
            return;
        }
        try {
            const res = await fetch(`http://localhost:3001/api/posts/${postId}/like`, {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({ email: userProfile.email })
            });

            if (res.ok) {
                fetchPosts();
            } else {
                const errData = await res.json();
                alert(errData.message || "Failed to toggle like.");
            }
        } catch (err) {
            console.error("Toggle like error:", err);
        }
    };

    const handleCommentChange = (postId, value) => {
        setCommentInputs({ ...commentInputs, [postId]: value });
    };

    const handleAddComment = async (postId) => {
        const content = commentInputs[postId];
        if (!content?.trim()) return;

        try {
            const res = await fetch(`http://localhost:3001/api/posts/${postId}/comments`, {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({
                    author: userProfile?.username || "Anonymous",
                    content
                }),
            });
            if (res.ok) {
                const res2 = await fetch(`http://localhost:3001/api/posts/${postId}/comments`);
                const data = await res2.json();
                setComments(prev => ({ ...prev, [postId]: data }));
                setCommentInputs(prev => ({ ...prev, [postId]: "" }));
            }
        } catch (err) {
            console.error("Comment error:", err);
        }
    };

    const handleDeleteComment = async (postId, index, content) => {
        try {
            const res = await fetch(`http://localhost:3001/api/posts/${postId}/comments/delete`, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({
                content,
                author: userProfile.username
            })
            });
            if (res.ok) {
                const res2 = await fetch(`http://localhost:3001/api/posts/${postId}/comments`);
                const data = await res2.json();
                setComments(prev => ({ ...prev, [postId]: data }));
            } else {
                const err = await res.json();
                alert(err.message || "Failed to delete comment.");
            }
        } catch (err) {
            console.error("Delete comment error:", err);
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
                            <p>
                                <strong>{post.author}</strong> - {new Date(post.time).toLocaleString('sv-SE', {
                                    hour12: false
                                })}
                            </p>
                        </div>
                        <h3>{post.title}</h3>
                        <p>{post.content}</p>
                        <button onClick={() => handleLike(post.id)}>
                            👍 Like
                        </button> {post.likes}
                        <div>
                            <input
                                value={commentInputs[post.id] || ''}
                                onChange={(e) => handleCommentChange(post.id, e.target.value)}
                                placeholder="Write a comment..."
                            />
                            <button onClick={() => handleAddComment(post.id)}>Comment</button>
                        </div>
                        <ul>
                            {(comments[post.id] || []).map((c, idx) => (
                                <li
                                    key={idx}
                                    className="comment-item"
                                    style={{ display: 'flex', alignItems: 'center', gap: '8px' }}
                                    >
                                    {c.author === userProfile?.username && (
                                        <button
                                            className="delete-comment-btn"
                                            onClick={() => handleDeleteComment(post.id, idx, c.content)}
                                        >
                                            <svg xmlns="http://www.w3.org/2000/svg" height="20px" viewBox="0 -960 960 960" width="20px" fill="#1f1f1f">
                                                <path d="m256-200-56-56 224-224-224-224 56-56 224 224 224-224 56 56-224 224 224 224-56 56-224-224-224 224Z"/>
                                            </svg>
                                        </button>
                                    )}
                                    <span>
                                        <strong>{c.author}</strong> ({new Date(c.time).toLocaleString('sv-SE')}): {c.content}
                                    </span>
                                </li>
                            ))}
                        </ul>
                    </div>
                ))}
            </div>
        </div>
    );
}

export default Community;