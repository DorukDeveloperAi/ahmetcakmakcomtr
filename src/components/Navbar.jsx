import React, { useState, useEffect, useRef } from 'react';
import { FaMoon, FaSun, FaBars, FaTimes, FaCode, FaGlobe, FaChevronDown } from 'react-icons/fa';
import { motion, AnimatePresence } from 'framer-motion';
import { useLanguage } from '../context/LanguageContext';
import './Navbar.css';

const Navbar = ({ theme, toggleTheme }) => {
  const [isOpen, setIsOpen] = useState(false);
  const [scrolled, setScrolled] = useState(false);
  const [isLangOpen, setIsLangOpen] = useState(false);
  const { language, changeLanguage, t } = useLanguage();
  const langMenuRef = useRef(null);

  useEffect(() => {
    const handleScroll = () => {
      setScrolled(window.scrollY > 50);
    };
    window.addEventListener('scroll', handleScroll);

    // Close dropdown when clicking outside
    const handleClickOutside = (event) => {
      if (langMenuRef.current && !langMenuRef.current.contains(event.target)) {
        setIsLangOpen(false);
      }
    };
    document.addEventListener('mousedown', handleClickOutside);

    return () => {
      window.removeEventListener('scroll', handleScroll);
      document.removeEventListener('mousedown', handleClickOutside);
    };
  }, []);

  const navLinks = [
    { name: t.nav.home, href: '#home' },
    { name: t.nav.projects, href: '#projects' },
    { name: t.nav.skills, href: '#skills' },
    { name: t.nav.about, href: '#about' },
    { name: t.nav.contact, href: '#contact' },
  ];

  const languages = [
    { code: 'tr', label: 'Türkçe', flag: '🇹🇷' },
    { code: 'en', label: 'English', flag: '🇺🇸' },
    { code: 'ar', label: 'العربية', flag: '🇸🇦' },
  ];

  const handleLangSelect = (langCode) => {
    changeLanguage(langCode);
    setIsLangOpen(false);
  };

  return (
    <nav className={`navbar ${scrolled ? 'scrolled' : ''}`}>
      <div className="container navbar-container">
        <a href="#home" className="logo">
          <FaCode className="logo-icon" />
          <span>DevPortfolio</span>
        </a>

        <div className="desktop-menu">
          {navLinks.map((link) => (
            <a key={link.name} href={link.href} className="nav-link">
              {link.name}
            </a>
          ))}

          <div className="lang-dropdown-container" ref={langMenuRef}>
            <button
              onClick={() => setIsLangOpen(!isLangOpen)}
              className="lang-toggle"
              aria-label="Select Language"
            >
              <FaGlobe /> {language.toUpperCase()} <FaChevronDown className={`chevron ${isLangOpen ? 'open' : ''}`} />
            </button>

            <AnimatePresence>
              {isLangOpen && (
                <motion.div
                  className="lang-dropdown"
                  initial={{ opacity: 0, y: 10 }}
                  animate={{ opacity: 1, y: 0 }}
                  exit={{ opacity: 0, y: 10 }}
                  transition={{ duration: 0.2 }}
                >
                  {languages.map((lang) => (
                    <button
                      key={lang.code}
                      className={`lang-option ${language === lang.code ? 'active' : ''}`}
                      onClick={() => handleLangSelect(lang.code)}
                    >
                      <span className="lang-flag">{lang.flag}</span>
                      <span className="lang-label">{lang.label}</span>
                    </button>
                  ))}
                </motion.div>
              )}
            </AnimatePresence>
          </div>

          <button onClick={toggleTheme} className="theme-toggle" aria-label="Toggle Theme">
            {theme === 'dark' ? <FaSun /> : <FaMoon />}
          </button>
        </div>

        <div className="mobile-controls">
          {/* Mobile Language Toggle - Simplified for mobile */}
          <div className="lang-dropdown-container" ref={langMenuRef}>
            <button
              onClick={() => setIsLangOpen(!isLangOpen)}
              className="lang-toggle"
              aria-label="Select Language"
            >
              {language.toUpperCase()}
            </button>
            <AnimatePresence>
              {isLangOpen && (
                <motion.div
                  className="lang-dropdown mobile-lang-dropdown"
                  initial={{ opacity: 0, y: 10 }}
                  animate={{ opacity: 1, y: 0 }}
                  exit={{ opacity: 0, y: 10 }}
                  transition={{ duration: 0.2 }}
                >
                  {languages.map((lang) => (
                    <button
                      key={lang.code}
                      className={`lang-option ${language === lang.code ? 'active' : ''}`}
                      onClick={() => handleLangSelect(lang.code)}
                    >
                      <span className="lang-flag">{lang.flag}</span>
                      <span className="lang-label">{lang.label}</span>
                    </button>
                  ))}
                </motion.div>
              )}
            </AnimatePresence>
          </div>

          <button onClick={toggleTheme} className="theme-toggle" aria-label="Toggle Theme">
            {theme === 'dark' ? <FaSun /> : <FaMoon />}
          </button>
          <button onClick={() => setIsOpen(!isOpen)} className="menu-toggle" aria-label="Toggle Menu">
            {isOpen ? <FaTimes /> : <FaBars />}
          </button>
        </div>

        <AnimatePresence>
          {isOpen && (
            <motion.div
              initial={{ opacity: 0, y: -20 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, y: -20 }}
              className="mobile-menu"
            >
              {navLinks.map((link) => (
                <a
                  key={link.name}
                  href={link.href}
                  className="mobile-nav-link"
                  onClick={() => setIsOpen(false)}
                >
                  {link.name}
                </a>
              ))}
            </motion.div>
          )}
        </AnimatePresence>
      </div>
    </nav>
  );
};

export default Navbar;
