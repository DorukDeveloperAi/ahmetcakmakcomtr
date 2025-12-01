import React, { useState, useEffect } from 'react';
import Navbar from './components/Navbar';
import Hero from './components/Hero';
import Projects from './components/Projects';
import Skills from './components/Skills';
import About from './components/About';
import Contact from './components/Contact';
import Footer from './components/Footer';
import './App.css';
import { LanguageProvider } from './context/LanguageContext';

import SEO from './components/SEO';

function App() {
    const [theme, setTheme] = useState('dark');

    useEffect(() => {
        // Check for saved theme preference
        const savedTheme = localStorage.getItem('theme');
        if (savedTheme) {
            setTheme(savedTheme);
        }
    }, []);

    useEffect(() => {
        document.documentElement.setAttribute('data-theme', theme);
        localStorage.setItem('theme', theme);
    }, [theme]);

    const toggleTheme = () => {
        setTheme((prevTheme) => (prevTheme === 'dark' ? 'light' : 'dark'));
    };

    return (
        <LanguageProvider>
            <SEO />
            <div className="App">
                <Navbar theme={theme} toggleTheme={toggleTheme} />
                <main>
                    <Hero />
                    <Projects />
                    <Skills />
                    <About />
                    <Contact />
                </main>
                <Footer />
            </div>
        </LanguageProvider>
    );
}

export default App;
