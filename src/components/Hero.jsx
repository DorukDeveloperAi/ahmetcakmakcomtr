import React from 'react';
import { motion } from 'framer-motion';
import { FaGithub, FaLinkedin, FaTwitter, FaArrowDown, FaDownload } from 'react-icons/fa';
import { useLanguage } from '../context/LanguageContext';
import './Hero.css';

const Hero = () => {
    const { t } = useLanguage();

    return (
        <section id="home" className="hero">
            <div className="hero-background">
                <div className="code-lines"></div>
            </div>

            <div className="container hero-container">
                <motion.div
                    className="hero-content"
                    initial={{ opacity: 0, x: -50 }}
                    animate={{ opacity: 1, x: 0 }}
                    transition={{ duration: 0.8 }}
                >
                    <h2 className="greeting">{t.hero.greeting}</h2>
                    <h1 className="name">Ahmet ÇAKMAK</h1>
                    <div className="typewriter">
                        <span className="role">{t.hero.role}</span>
                    </div>
                    <p className="bio">
                        {t.hero.bio}
                    </p>

                    <div className="cta-group">
                        <a href="#projects" className="btn btn-primary">
                            {t.hero.explore} <FaArrowDown />
                        </a>
                        <a href="/resume.pdf" className="btn btn-outline" download>
                            {t.hero.downloadCv} <FaDownload />
                        </a>
                    </div>

                    <div className="social-links">
                        <a href="https://github.com" target="_blank" rel="noreferrer"><FaGithub /></a>
                        <a href="https://linkedin.com" target="_blank" rel="noreferrer"><FaLinkedin /></a>
                        <a href="https://twitter.com" target="_blank" rel="noreferrer"><FaTwitter /></a>
                    </div>
                </motion.div>

                <motion.div
                    className="hero-image"
                    initial={{ opacity: 0, scale: 0.8 }}
                    animate={{ opacity: 1, scale: 1 }}
                    transition={{ duration: 0.8, delay: 0.2 }}
                >
                    <div className="img-wrapper">
                        {/* Placeholder for profile image or abstract icon */}
                        <div className="placeholder-img">
                            <span className="code-icon">{'</>'}</span>
                        </div>
                    </div>
                </motion.div>
            </div>
        </section>
    );
};

export default Hero;
