import React, { useState, useEffect } from 'react';
import { motion } from 'framer-motion';
import { FaStar } from 'react-icons/fa';
import { useLanguage } from '../context/LanguageContext';
import './Testimonials.css';

const Testimonials = () => {
    const [testimonials, setTestimonials] = useState([]);
    const [loading, setLoading] = useState(true);
    const { language, t } = useLanguage();

    useEffect(() => {
        const fetchTestimonials = async () => {
            try {
                const response = await fetch(`/api/get_testimonials.php?lang=${language}`);
                if (!response.ok) throw new Error('Network response was not ok');
                const data = await response.json();
                setTestimonials(data);
            } catch (error) {
                console.error('Error fetching testimonials:', error);
                // Fallback data if API fails (e.g. local dev without PHP)
                setTestimonials([
                    {
                        id: 1,
                        name: "Mehmet Yılmaz",
                        role: "CTO",
                        company: "TechCorp",
                        text: "Ahmet ile çalışmak harikaydı. Projemizi zamanında ve mükemmel kalitede teslim etti.",
                        image: "https://randomuser.me/api/portraits/men/32.jpg",
                        rating: 5
                    },
                    {
                        id: 2,
                        name: "Ayşe Demir",
                        role: "Product Manager",
                        company: "StartUp Inc",
                        text: "Yaratıcı çözümleri ve teknik bilgisiyle projemize değer kattı. Kesinlikle tavsiye ederim.",
                        image: "https://randomuser.me/api/portraits/women/44.jpg",
                        rating: 5
                    },
                    {
                        id: 3,
                        name: "Caner Erkin",
                        role: "Founder",
                        company: "Digital Agency",
                        text: "Hızlı, güvenilir ve profesyonel. Beklentilerimizin çok ötesinde bir iş çıkardı.",
                        image: "https://randomuser.me/api/portraits/men/85.jpg",
                        rating: 5
                    }
                ]);
            } finally {
                setLoading(false);
            }
        };

        fetchTestimonials();
    }, [language]);

    return (
        <section id="testimonials" className="section testimonials-section">
            <div className="container testimonials-container">
                <motion.h2
                    className="section-title"
                    initial={{ opacity: 0, y: 20 }}
                    whileInView={{ opacity: 1, y: 0 }}
                    viewport={{ once: true }}
                >
                    {t.testimonials.title}
                </motion.h2>

                <div className="testimonials-grid">
                    {testimonials.map((item, index) => (
                        <motion.div
                            key={item.id}
                            className="testimonial-card"
                            initial={{ opacity: 0, y: 30 }}
                            whileInView={{ opacity: 1, y: 0 }}
                            viewport={{ once: true }}
                            transition={{ delay: index * 0.1 }}
                        >
                            <div className="testimonial-header">
                                <img src={item.image} alt={item.name} className="testimonial-avatar" />
                                <div className="testimonial-info">
                                    <h4>{item.name}</h4>
                                    <span>{item.role}, {item.company}</span>
                                </div>
                            </div>
                            <p className="testimonial-text">{item.text}</p>
                            <div className="rating">
                                {[...Array(item.rating || 5)].map((_, i) => (
                                    <FaStar key={i} />
                                ))}
                            </div>
                        </motion.div>
                    ))}
                </div>
            </div>
        </section>
    );
};

export default Testimonials;
