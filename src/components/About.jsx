import React from 'react';
import { motion } from 'framer-motion';
import { useLanguage } from '../context/LanguageContext';
import './About.css';

const About = () => {
    const { t } = useLanguage();

    return (
        <section id="about" className="section about-section">
            <div className="container">
                <motion.h2
                    className="section-title"
                    initial={{ opacity: 0, y: 20 }}
                    whileInView={{ opacity: 1, y: 0 }}
                    viewport={{ once: true }}
                >
                    {t.about.title}
                </motion.h2>

                <div className="about-content">
                    <motion.div
                        className="about-text"
                        initial={{ opacity: 0, x: -30 }}
                        whileInView={{ opacity: 1, x: 0 }}
                        viewport={{ once: true }}
                    >
                        <p>{t.about.p1}</p>
                        <p>{t.about.p2}</p>
                        <p>{t.about.p3}</p>
                    </motion.div>

                    <motion.div
                        className="timeline"
                        initial={{ opacity: 0, x: 30 }}
                        whileInView={{ opacity: 1, x: 0 }}
                        viewport={{ once: true }}
                    >
                        {t.about.timeline.map((item, index) => (
                            <div className="timeline-item" key={index}>
                                <span className="year">{item.year}</span>
                                <div className="timeline-content">
                                    <h3>{item.title}</h3>
                                    <p>{item.desc}</p>
                                </div>
                            </div>
                        ))}
                    </motion.div>
                </div>
            </div>
        </section>
    );
};

export default About;
