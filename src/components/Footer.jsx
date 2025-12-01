import React from 'react';
import { FaGithub, FaLinkedin, FaTwitter, FaHeart } from 'react-icons/fa';
import { useLanguage } from '../context/LanguageContext';
import './Footer.css';

const Footer = () => {
    const { t } = useLanguage();

    return (
        <footer className="footer">
            <div className="container footer-container">
                <div className="footer-socials">
                    <a href="https://github.com" target="_blank" rel="noreferrer"><FaGithub /></a>
                    <a href="https://linkedin.com" target="_blank" rel="noreferrer"><FaLinkedin /></a>
                    <a href="https://twitter.com" target="_blank" rel="noreferrer"><FaTwitter /></a>
                </div>
                <p className="copyright">
                    © {new Date().getFullYear()} Ahmet ÇAKMAK. {t.footer.rights}
                </p>
                <p className="made-with">
                    {t.footer.madeWith} <FaHeart className="heart-icon" /> and React
                </p>
            </div>
        </footer>
    );
};

export default Footer;
