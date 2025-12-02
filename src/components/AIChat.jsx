import React, { useState, useRef, useEffect } from 'react';
import { FaRobot, FaPaperPlane, FaTimes } from 'react-icons/fa';
import { motion, AnimatePresence } from 'framer-motion';
import { useLanguage } from '../context/LanguageContext';
import './AIChat.css';

const AIChat = () => {
    const { t } = useLanguage();
    const [isOpen, setIsOpen] = useState(false);
    const [messages, setMessages] = useState([]);
    const [inputText, setInputText] = useState('');
    const messagesEndRef = useRef(null);

    // Initialize greeting message when component mounts or language changes
    useEffect(() => {
        if (messages.length === 0) {
            setMessages([
                { id: 1, text: t.aiChat.greeting, sender: 'bot' }
            ]);
        }
    }, [t.aiChat.greeting]);

    const scrollToBottom = () => {
        messagesEndRef.current?.scrollIntoView({ behavior: "smooth" });
    };

    useEffect(() => {
        scrollToBottom();
    }, [messages]);

    const handleSend = async () => {
        if (!inputText.trim()) return;

        const userMessage = { id: Date.now(), text: inputText, sender: 'user' };
        setMessages(prev => [...prev, userMessage]);
        setInputText('');

        // Simulate AI thinking
        setTimeout(async () => {
            let botResponseText = t.aiChat.unknown;
            const lowerInput = userMessage.text.toLowerCase();

            if (lowerInput.includes('merhaba') || lowerInput.includes('selam') || lowerInput.includes('hello') || lowerInput.includes('hi')) {
                botResponseText = t.aiChat.projectsQuery;
            } else if (lowerInput.includes('iletişim') || lowerInput.includes('mail') || lowerInput.includes('contact') || lowerInput.includes('email')) {
                botResponseText = t.aiChat.contactQuery;
            } else if (lowerInput.includes('proje') || lowerInput.includes('neler yaptın') || lowerInput.includes('project') || lowerInput.includes('portfolio')) {
                botResponseText = t.aiChat.portfolioQuery;
            } else if (lowerInput.includes('teknoloji') || lowerInput.includes('dil') || lowerInput.includes('tech') || lowerInput.includes('stack')) {
                botResponseText = t.aiChat.techQuery;
            }

            const botResponse = { id: Date.now() + 1, text: botResponseText, sender: 'bot' };
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
                        bot_response: botResponseText
                    }),
                });
            } catch (error) {
                console.error('Error saving chat log:', error);
            }
        }, 1000);
    };

    const handleKeyPress = (e) => {
        if (e.key === 'Enter') handleSend();
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
                    >
                        <div className="chat-header">
                            <h3>{t.aiChat.title}</h3>
                            <button className="close-chat" onClick={() => setIsOpen(false)}>
                                <FaTimes />
                            </button>
                        </div>
                        <div className="chat-messages">
                            {messages.map((msg) => (
                                <div key={msg.id} className={`message ${msg.sender}`}>
                                    {msg.text}
                                </div>
                            ))}
                            <div ref={messagesEndRef} />
                        </div>
                        <div className="chat-input-area">
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

            <button className="ai-chat-btn" onClick={() => setIsOpen(!isOpen)}>
                <FaRobot />
            </button>
        </div>
    );
};

export default AIChat;
