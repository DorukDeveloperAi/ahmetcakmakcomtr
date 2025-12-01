import React from 'react';
import { motion } from 'framer-motion';
import { FaEnvelope, FaLinkedin, FaGithub, FaTwitter, FaWhatsapp } from 'react-icons/fa';
import { useLanguage } from '../context/LanguageContext';
import './Contact.css';

const Contact = () => {
    const { t } = useLanguage();

    return (
        <section id="contact" className="section contact-section">
            <div className="container">
                <motion.h2
                    className="section-title"
                    initial={{ opacity: 0, y: 20 }}
                    whileInView={{ opacity: 1, y: 0 }}
                    viewport={{ once: true }}
                >
                    {t.contact.title}
                </motion.h2>

                <div className="contact-container">
                    <motion.div
                        className="contact-info"
                        initial={{ opacity: 0, x: -30 }}
                        whileInView={{ opacity: 1, x: 0 }}
                        viewport={{ once: true }}
                    >
                        <h3>{t.contact.subtitle}</h3>
                        <p>
                            {t.contact.desc}
                        </p>

                        <div className="contact-links">
                            <a href="mailto:kamkactemha@hotmail.com" className="contact-link">
                                <FaEnvelope /> kamkactemha@hotmail.com
                            </a>
                            <a href="https://wa.me/905317626327" className="contact-link" target="_blank" rel="noreferrer">
                                <FaWhatsapp /> +90 531 762 63 27
                            </a>
                            <div className="social-icons">
                                <a href="https://linkedin.com" target="_blank" rel="noreferrer"><FaLinkedin /></a>
                                <a href="https://github.com" target="_blank" rel="noreferrer"><FaGithub /></a>
                                <a href="https://twitter.com" target="_blank" rel="noreferrer"><FaTwitter /></a>
                            </div>
                        </div>
                    </motion.div>

                    <motion.form
                        className="contact-form"
                        initial={{ opacity: 0, x: 30 }}
                        whileInView={{ opacity: 1, x: 0 }}
                        viewport={{ once: true }}
                        onSubmit={async (e) => {
                            e.preventDefault();
                            const formData = new FormData(e.target);
                            const data = {
                                name: formData.get('name'),
                                email: formData.get('email'),
                                message: formData.get('message')
                            };

                            const submitBtn = e.target.querySelector('button[type="submit"]');
                            const originalText = submitBtn.innerText;
                            submitBtn.innerText = 'Sending...';
                            submitBtn.disabled = true;

                            try {
                                const response = await fetch('/send-mail.php', {
                                    method: 'POST',
                                    headers: {
                                        'Content-Type': 'application/json',
                                    },
                                    body: JSON.stringify(data)
                                });

                                const result = await response.json();

                                if (result.status === 'success') {
                                    alert('Message sent successfully!');
                                    e.target.reset();
                                } else {
                                    throw new Error(result.message || 'Failed to send');
                                }
                            } catch (error) {
                                console.error('Email error:', error);
                                alert('Could not send email directly. Redirecting to WhatsApp...');
                                const waMessage = `Name: ${data.name}%0AEmail: ${data.email}%0AMessage: ${data.message}`;
                                window.open(`https://wa.me/905317626327?text=${waMessage}`, '_blank');
                            } finally {
                                submitBtn.innerText = originalText;
                                submitBtn.disabled = false;
                            }
                        }}
                    >
                        <div className="form-group">
                            <label htmlFor="name">{t.contact.form.name}</label>
                            <input type="text" id="name" name="name" placeholder="Ahmet ÇAKMAK" required />
                        </div>
                        <div className="form-group">
                            <label htmlFor="email">{t.contact.form.email}</label>
                            <input type="email" id="email" name="email" placeholder="ahmet@example.com" required />
                        </div>
                        <div className="form-group">
                            <label htmlFor="message">{t.contact.form.message}</label>
                            <textarea id="message" name="message" rows="5" placeholder="..." required></textarea>
                        </div>
                        <button type="submit" className="btn btn-primary">{t.contact.form.send}</button>
                    </motion.form>
                </div>
            </div>
        </section>
    );
};

export default Contact;
