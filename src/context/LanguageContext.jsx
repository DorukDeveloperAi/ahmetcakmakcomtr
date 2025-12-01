import React, { createContext, useState, useContext, useEffect } from 'react';
import { translations } from '../data/translations';

const LanguageContext = createContext();

export const LanguageProvider = ({ children }) => {
    const [language, setLanguage] = useState('tr'); // Default to Turkish

    useEffect(() => {
        const savedLang = localStorage.getItem('language');
        if (savedLang) {
            setLanguage(savedLang);
        } else {
            // Optional: Detect browser language
            const browserLang = navigator.language.split('-')[0];
            if (browserLang === 'en' || browserLang === 'ar') {
                setLanguage(browserLang);
            }
        }
    }, []);

    useEffect(() => {
        // Handle RTL for Arabic
        if (language === 'ar') {
            document.documentElement.setAttribute('dir', 'rtl');
            document.documentElement.lang = 'ar';
        } else {
            document.documentElement.setAttribute('dir', 'ltr');
            document.documentElement.lang = language;
        }
        localStorage.setItem('language', language);
    }, [language]);

    const changeLanguage = (lang) => {
        setLanguage(lang);
    };

    const t = translations[language];

    return (
        <LanguageContext.Provider value={{ language, changeLanguage, t }}>
            {children}
        </LanguageContext.Provider>
    );
};

export const useLanguage = () => useContext(LanguageContext);
