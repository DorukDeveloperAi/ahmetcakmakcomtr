import React, { useState, useRef, useEffect } from 'react';
import { FaRobot, FaPaperPlane, FaTimes } from 'react-icons/fa';
import { motion, AnimatePresence } from 'framer-motion';
import './AIChat.css';

const AIChat = () => {
    const [isOpen, setIsOpen] = useState(false);
    const [messages, setMessages] = useState([
        { id: 1, text: "Merhaba! Ben Ahmet'in AI asistanıyım. Size nasıl yardımcı olabilirim?", sender: 'bot' }
    ]);
    const [inputText, setInputText] = useState('');
    const messagesEndRef = useRef(null);

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
        setTimeout(() => {
            let botResponseText = "Bunu henüz öğrenmedim, ama Ahmet'e iletebilirim!";
            const lowerInput = userMessage.text.toLowerCase();

            if (lowerInput.includes('merhaba') || lowerInput.includes('selam')) {
                botResponseText = "Selam! Projelerim hakkında bilgi almak ister misin?";
            } else if (lowerInput.includes('iletişim') || lowerInput.includes('mail')) {
                botResponseText = "Ahmet'e ahmet@example.com adresinden ulaşabilirsin.";
            } else if (lowerInput.includes('proje') || lowerInput.includes('neler yaptın')) {
                botResponseText = "Ahmet'in portföyünde Full Stack web uygulamaları, mobil uygulamalar ve yapay zeka entegrasyonları bulunuyor. 'Projeler' bölümüne göz atabilirsin!";
            } else if (lowerInput.includes('teknoloji') || lowerInput.includes('dil')) {
                botResponseText = "Ahmet genellikle React, Node.js, Python ve PHP kullanıyor.";
            }

            const botResponse = { id: Date.now() + 1, text: botResponseText, sender: 'bot' };
            setMessages(prev => [...prev, botResponse]);
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
                            <h3>Ahmet AI Asistan</h3>
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
                                placeholder="Bir şeyler sorun..."
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
