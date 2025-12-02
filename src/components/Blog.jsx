import React, { useState, useEffect } from 'react';
import { motion } from 'framer-motion';
import { FaArrowRight } from 'react-icons/fa';
import { useLanguage } from '../context/LanguageContext';
import './Blog.css';

const Blog = () => {
    const [blogs, setBlogs] = useState([]);
    const [loading, setLoading] = useState(true);
    const { language, t } = useLanguage();

    useEffect(() => {
        const fetchBlogs = async () => {
            try {
                const response = await fetch(`/api/get_blogs.php?lang=${language}`);
                if (!response.ok) throw new Error('Network response was not ok');
                const data = await response.json();
                setBlogs(data);
            } catch (error) {
                console.error('Error fetching blogs:', error);
                // Fallback data using translations
                setBlogs([
                    {
                        id: 1,
                        title: t.blog.fallback.post1.title,
                        slug: "modern-web-development-2025",
                        summary: t.blog.fallback.post1.summary,
                        image: "https://images.unsplash.com/photo-1498050108023-c5249f4df085?q=80&w=600&auto=format&fit=crop",
                        category: t.blog.fallback.post1.category
                    },
                    {
                        id: 2,
                        title: t.blog.fallback.post2.title,
                        slug: "coding-with-antigravity",
                        summary: t.blog.fallback.post2.summary,
                        image: "https://images.unsplash.com/photo-1620712943543-bcc4688e7485?q=80&w=600&auto=format&fit=crop",
                        category: t.blog.fallback.post2.category
                    }
                ]);
            } finally {
                setLoading(false);
            }
        };

        fetchBlogs();
    }, [language, t]);

    return (
        <section id="blog" className="section blog-section">
            <div className="container">
                <motion.h2
                    className="section-title"
                    initial={{ opacity: 0, y: 20 }}
                    whileInView={{ opacity: 1, y: 0 }}
                    viewport={{ once: true }}
                >
                    {t.blog.title}
                </motion.h2>

                <div className="blog-grid">
                    {blogs.map((post, index) => (
                        <motion.div
                            key={post.id}
                            className="blog-card"
                            initial={{ opacity: 0, y: 30 }}
                            whileInView={{ opacity: 1, y: 0 }}
                            viewport={{ once: true }}
                            transition={{ delay: index * 0.1 }}
                        >
                            <img src={post.image} alt={post.title} className="blog-image" />
                            <div className="blog-content">
                                <span className="blog-category">{post.category}</span>
                                <h3 className="blog-title">{post.title}</h3>
                                <p className="blog-summary">{post.summary}</p>
                                <a href={`#blog/${post.slug}`} className="read-more">
                                    {t.blog.readMore} <FaArrowRight />
                                </a>
                            </div>
                        </motion.div>
                    ))}
                </div>
            </div>
        </section>
    );
};

export default Blog;
