import React, { useState, useRef, useEffect } from 'react';
import { FaRobot, FaPaperPlane, FaTimes, FaSmile } from 'react-icons/fa';
import { motion, AnimatePresence } from 'framer-motion';
import { useLanguage } from '../context/LanguageContext';
import './AIChat.css';

const AIChat = () => {
    const { t, language } = useLanguage();
    const [isOpen, setIsOpen] = useState(false);
    const [messages, setMessages] = useState([]);
    const [inputText, setInputText] = useState('');
    const [isTyping, setIsTyping] = useState(false);
    const [showEmojiPicker, setShowEmojiPicker] = useState(false);
    const messagesEndRef = useRef(null);

    // Emoji list
    const emojis = ['😊', '👍', '❤️', '🎉', '🚀', '💡', '🤔', '😄', '👏', '🙏', '💪', '✨', '🔥', '💻', '📱', '🌟'];

    // Initialize greeting message
    useEffect(() => {
        if (messages.length === 0) {
            setMessages([
                { id: 1, text: t.aiChat.greeting, sender: 'bot', timestamp: new Date() }
            ]);
        }
    }, [t.aiChat.greeting]);

    const scrollToBottom = () => {
        messagesEndRef.current?.scrollIntoView({ behavior: "smooth" });
    };

    useEffect(() => {
        scrollToBottom();
    }, [messages, isTyping]);

    // Sentiment Analysis (simple keyword-based)
    const analyzeSentiment = (text) => {
        const positiveWords = ['good', 'great', 'excellent', 'awesome', 'love', 'amazing', 'iyi', 'harika', 'mükemmel', 'güzel', 'süper', 'muhteşem'];
        const negativeWords = ['bad', 'terrible', 'hate', 'awful', 'poor', 'kötü', 'berbat', 'rezalet'];

        const lowerText = text.toLowerCase();
        const hasPositive = positiveWords.some(word => lowerText.includes(word));
        const hasNegative = negativeWords.some(word => lowerText.includes(word));

        if (hasPositive && !hasNegative) return 'positive';
        if (hasNegative && !hasPositive) return 'negative';
        return 'neutral';
    };

    // Helper to normalize Turkish characters
    const normalizeString = (str) => {
        return str.toLowerCase()
            .replace(/ğ/g, 'g')
            .replace(/ü/g, 'u')
            .replace(/ş/g, 's')
            .replace(/ı/g, 'i')
            .replace(/İ/g, 'i')
            .replace(/ö/g, 'o')
            .replace(/ç/g, 'c');
    };

    // Enhanced AI Response Logic with comprehensive knowledge base
    const generateResponse = (userInput) => {
        const lowerInput = normalizeString(userInput);

        // Greetings
        if (lowerInput.includes('merhaba') || lowerInput.includes('selam') ||
            lowerInput.includes('hello') || lowerInput.includes('hi') ||
            lowerInput.includes('hey') || lowerInput.includes('gunaydin') ||
            lowerInput.includes('iyi gunler') ||
            lowerInput.includes('selamlar') || lowerInput.includes('naber') ||
            lowerInput.includes('nasil') || lowerInput.includes('good morning')) {
            return t.aiChat.projectsQuery;
        }

        // Contact Information
        if (lowerInput.includes('iletisim') || lowerInput.includes('mail') ||
            lowerInput.includes('email') || lowerInput.includes('contact') ||
            lowerInput.includes('ulas') || lowerInput.includes('telefon') ||
            lowerInput.includes('adres') || lowerInput.includes('nasil ulas')) {
            return t.aiChat.contactQuery;
        }

        // Projects/Portfolio
        if (lowerInput.includes('proje') || lowerInput.includes('portfolio') ||
            lowerInput.includes('neler yaptin') || lowerInput.includes('calisma') ||
            lowerInput.includes('project') || lowerInput.includes('work') ||
            lowerInput.includes('yaptigin') || lowerInput.includes('isler') ||
            lowerInput.includes('portfoy')) {
            return t.aiChat.portfolioQuery;
        }

        // Technology Stack
        if (lowerInput.includes('teknoloji') || lowerInput.includes('dil') ||
            lowerInput.includes('framework') || lowerInput.includes('tech') ||
            lowerInput.includes('stack') || lowerInput.includes('kullan') ||
            lowerInput.includes('yazilim') || lowerInput.includes('language') ||
            lowerInput.includes('programlama') || lowerInput.includes('kod') ||
            lowerInput.includes('hangi dil')) {
            return t.aiChat.techQuery;
        }

        // Skills
        if (lowerInput.includes('yetenek') || lowerInput.includes('beceri') ||
            lowerInput.includes('skill') || lowerInput.includes('ne yapabilir') ||
            lowerInput.includes('capability') || lowerInput.includes('uzman')) {
            return "Full Stack Web Development, Mobile App Development (iOS/Android), AI Integration, Cloud Computing ve DevOps konularında uzmanım! 💻";
        }

        // Experience
        if (lowerInput.includes('deneyim') || lowerInput.includes('tecrube') ||
            lowerInput.includes('experience') || lowerInput.includes('kac yil') ||
            lowerInput.includes('how long') || lowerInput.includes('ne kadar') ||
            lowerInput.includes('suredir')) {
            return "10+ yıllık IT ve yazılım geliştirme deneyimim var. Sistem yönetiminden web development'a kadar geniş bir yelpazede çalıştım. 🚀";
        }

        // Services
        if (lowerInput.includes('hizmet') || lowerInput.includes('servis') ||
            lowerInput.includes('service') || lowerInput.includes('danismanlik') ||
            lowerInput.includes('consulting') || lowerInput.includes('ne sunuyor') ||
            lowerInput.includes('ne yapiyor')) {
            return "Web Site Danışmanlığı, ERP & CRM Çözümleri, Sosyal Medya Yönetimi, IT Altyapı Danışmanlığı ve AI Entegrasyonu hizmetleri sunuyorum! 🎯";
        }

        // About
        if (lowerInput.includes('kimsin') || lowerInput.includes('sen kimsin') ||
            lowerInput.includes('who are you') || lowerInput.includes('hakkinda') ||
            lowerInput.includes('about') || lowerInput.includes('tanit')) {
            return "Ben Ahmet'in AI asistanıyım! 🤖 Size Ahmet'in projeleri, yetenekleri ve hizmetleri hakkında bilgi verebilirim. Ne öğrenmek istersiniz?";
        }

        // Thanks
        if (lowerInput.includes('tesekkur') || lowerInput.includes('sagol') ||
            lowerInput.includes('thanks') || lowerInput.includes('thank you') ||
            lowerInput.includes('merci') || lowerInput.includes('eyvallah')) {
            return "Rica ederim! Başka bir konuda yardımcı olabilir miyim? 😊";
        }

        // Help
        if (lowerInput.includes('yardim') || lowerInput.includes('help') ||
            lowerInput.includes('ne sorabilir')) {
            return "Size şunları sorabilirsiniz:\n• Projeler ve portfolio\n• Teknolojiler\n• Hizmetler\n• Deneyim\n• İletişim bilgileri\nNe öğrenmek istersiniz? 🤔";
        }

        // Price/Cost
        if (lowerInput.includes('fiyat') || lowerInput.includes('ucret') ||
            lowerInput.includes('price') || lowerInput.includes('cost') ||
            lowerInput.includes('kaca') || lowerInput.includes('para')) {
            return "Fiyatlandırma proje bazlı değişmektedir. Detaylı bilgi ve teklif için benimle iletişime geçebilirsiniz! 💰";
        }

        // Positive feedback
        if (analyzeSentiment(userInput) === 'positive') {
            return "Çok sevindim! Daha fazla yardımcı olabileceğim bir konu var mı? 🎉";
        }

        // Default
        return "Bu konuda henüz bilgim yok. Ama şunları sorabilirsiniz:\n• Projeler ve portfolio\n• Kullanılan teknolojiler\n• Hizmetler\n• İletişim bilgileri 💡";
    };

    const handleSend = async () => {
        if (!inputText.trim()) return;

        const userMessage = {
            id: Date.now(),
            text: inputText,
            sender: 'user',
            timestamp: new Date(),
            sentiment: analyzeSentiment(inputText)
        };

        setMessages(prev => [...prev, userMessage]);
        setInputText('');
        setShowEmojiPicker(false);

        // Show typing indicator
        setIsTyping(true);

        // Simulate AI thinking delay
        setTimeout(async () => {
            let botResponseText = "";

            // 1. Try to get response from Database Knowledge Base
            try {
                const apiResponse = await fetch('/api/get_chat_response.php', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({
                        message: userMessage.text,
                        lang: language || 'tr'
                    })
                });

                if (apiResponse.ok) {
                    const data = await apiResponse.json();
                    if (data.found) {
                        botResponseText = data.answer;
                    }
                }
            } catch (error) {
                console.error("Knowledge base check failed:", error);
            }

            // 2. If no database response, use local AI logic
            if (!botResponseText) {
                botResponseText = generateResponse(userMessage.text);
            }

            const botResponse = {
                id: Date.now() + 1,
                text: botResponseText,
                sender: 'bot',
                timestamp: new Date()
            };

            setIsTyping(false);
            setMessages(prev => [...prev, botResponse]);

            // Save chat to database
            try {
                await fetch('/api/save_chat.php', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        user_message: userMessage.text,
                        bot_response: botResponseText,
                        sentiment: userMessage.sentiment
                    }),
                });
            } catch (error) {
                console.error('Error saving chat log:', error);
            }
        }, 1000);
    };

    const handleKeyPress = (e) => {
        if (e.key === 'Enter' && !e.shiftKey) {
            e.preventDefault();
            handleSend();
        }
    };

    const insertEmoji = (emoji) => {
        setInputText(prev => prev + emoji);
        setShowEmojiPicker(false);
    };

    return (
        <div className="ai-chat-widget">
            <AnimatePresence>
                {isOpen && (
                    <motion.div
                        className="ai-chat-window"
                        initial={{ opacity: 0, scale: 0.8, y: 20 }}
                        animate={{ opacity: 1, scale: 1, y: 0 }}
                        exit={{ opacity: 0, scale: 0.8, y: 20 }}
                        transition={{ type: "spring", damping: 25, stiffness: 300 }}
                    >
                        <div className="chat-header">
                            <h3>🤖 {t.aiChat.title}</h3>
                            <button className="close-chat" onClick={() => setIsOpen(false)}>
                                <FaTimes />
                            </button>
                        </div>

                        <div className="chat-messages">
                            {messages.map((msg) => (
                                <motion.div
                                    key={msg.id}
                                    className={`message ${msg.sender}`}
                                    initial={{ opacity: 0, y: 10 }}
                                    animate={{ opacity: 1, y: 0 }}
                                    transition={{ duration: 0.3 }}
                                    style={{ whiteSpace: 'pre-line' }}
                                >
                                    {msg.text}
                                    {msg.sentiment && msg.sender === 'user' && (
                                        <span className={`sentiment-badge ${msg.sentiment}`}>
                                            {msg.sentiment === 'positive' ? '😊' : msg.sentiment === 'negative' ? '😟' : '😐'}
                                        </span>
                                    )}
                                </motion.div>
                            ))}

                            {isTyping && (
                                <div className="typing-indicator">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                </div>
                            )}

                            <div ref={messagesEndRef} />
                        </div>

                        <div className="chat-input-area">
                            <button
                                className="emoji-picker-btn"
                                onClick={() => setShowEmojiPicker(!showEmojiPicker)}
                                type="button"
                            >
                                <FaSmile />
                            </button>

                            {showEmojiPicker && (
                                <div className="emoji-picker-popup">
                                    {emojis.map((emoji, index) => (
                                        <button
                                            key={index}
                                            onClick={() => insertEmoji(emoji)}
                                            type="button"
                                        >
                                            {emoji}
                                        </button>
                                    ))}
                                </div>
                            )}

                            <input
                                type="text"
                                className="chat-input"
                                placeholder={t.aiChat.placeholder}
                                value={inputText}
                                onChange={(e) => setInputText(e.target.value)}
                                onKeyPress={handleKeyPress}
                            />
                            <button className="chat-send-btn" onClick={handleSend}>
                                <FaPaperPlane />
                            </button>
                        </div>
                    </motion.div>
                )}
            </AnimatePresence>

            <motion.button
                className="ai-chat-btn"
                onClick={() => setIsOpen(!isOpen)}
                whileHover={{ scale: 1.1 }}
                whileTap={{ scale: 0.9 }}
            >
                <FaRobot />
            </motion.button>
        </div>
    );
};

export default AIChat;
