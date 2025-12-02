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
                // Fallback data
                setBlogs([
                    {
                        id: 1,
                        title: "Modern Web Geliştirme Trendleri 2025",
                        slug: "modern-web-gelistirme-2025",
                        summary: "2025 yılında web geliştirme dünyasında öne çıkan teknolojiler ve yaklaşımlar.",
                        image: "https://images.unsplash.com/photo-1498050108023-c5249f4df085?q=80&w=600&auto=format&fit=crop",
                        category: "Teknoloji"
                    },
                    {
                        id: 2,
                        title: "Neden React ve Vite?",
                        slug: "neden-react-ve-vite",
                        summary: "Projelerimde neden bu ikiliyi tercih ediyorum? Performans ve geliştirici deneyimi üzerine bir inceleme.",
                        image: "https://images.unsplash.com/photo-1633356122544-f134324a6cee?q=80&w=600&auto=format&fit=crop",
                        category: "Yazılım"
                    }
                ]);
            } finally {
                setLoading(false);
            }
        };

        fetchBlogs();
    }, [language]);

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
                                    Devamını Oku <FaArrowRight />
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
