import React from 'react';
import { motion } from 'framer-motion';
import { FaReact, FaNodeJs, FaPython, FaDocker, FaAws, FaFigma, FaHtml5, FaCss3Alt, FaJs, FaPhp, FaWindows, FaLinux, FaRobot, FaDatabase } from 'react-icons/fa';
import { SiTypescript, SiNextdotjs, SiTailwindcss, SiPostgresql, SiMongodb, SiMysql, SiRaspberrypi, SiArduino } from 'react-icons/si';
import { useLanguage } from '../context/LanguageContext';
import './Skills.css';

const skillsData = [
    { name: 'Antigravity', icon: <FaRobot />, color: '#FF3366' }, // Using a robot icon for Antigravity with a distinct color
    { name: 'React', icon: <FaReact />, color: '#61DAFB' },
    { name: 'Node.js', icon: <FaNodeJs />, color: '#339933' },
    { name: 'Python', icon: <FaPython />, color: '#3776AB' },
    { name: 'PHP', icon: <FaPhp />, color: '#777BB4' },
    { name: 'MySQL', icon: <SiMysql />, color: '#4479A1' },
    { name: 'MSSQL', icon: <FaDatabase />, color: '#CC2927' },
    { name: 'Raspberry Pi', icon: <SiRaspberrypi />, color: '#C51A4A' },
    { name: 'Arduino', icon: <SiArduino />, color: '#00979D' },
    { name: 'Windows Server', icon: <FaWindows />, color: '#0078D6' },
    { name: 'Linux', icon: <FaLinux />, color: '#FCC624' },
    { name: 'TypeScript', icon: <SiTypescript />, color: '#3178C6' },
    { name: 'Next.js', icon: <SiNextdotjs />, color: 'var(--text-primary)' }, // Adaptive color
    { name: 'Tailwind', icon: <SiTailwindcss />, color: '#06B6D4' },
    { name: 'Docker', icon: <FaDocker />, color: '#2496ED' },
    { name: 'HTML5', icon: <FaHtml5 />, color: '#E34F26' },
    { name: 'CSS3', icon: <FaCss3Alt />, color: '#1572B6' },
    { name: 'JavaScript', icon: <FaJs />, color: '#F7DF1E' },
];

const Skills = () => {
    const { t } = useLanguage();

    return (
        <section id="skills" className="section skills-section">
            <div className="container full-width-container">
                <motion.h2
                    className="section-title"
                    initial={{ opacity: 0, y: 20 }}
                    whileInView={{ opacity: 1, y: 0 }}
                    viewport={{ once: true }}
                >
                    {t.skills.title}
                </motion.h2>

                <div className="skills-marquee">
                    <div className="marquee-track">
                        {/* Duplicate the list to create seamless loop */}
                        {[...skillsData, ...skillsData].map((skill, index) => (
                            <div key={`${skill.name}-${index}`} className="skill-card">
                                <div className="skill-icon" style={{ color: skill.color }}>
                                    {skill.icon}
                                </div>
                                <span className="skill-name">{skill.name}</span>
                            </div>
                        ))}
                    </div>
                </div>
            </div>
        </section>
    );
};

export default Skills;
