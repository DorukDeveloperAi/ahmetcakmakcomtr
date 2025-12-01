import React from 'react';
import { motion } from 'framer-motion';
import { FaReact, FaNodeJs, FaPython, FaDocker, FaAws, FaFigma, FaHtml5, FaCss3Alt, FaJs } from 'react-icons/fa';
import { SiTypescript, SiNextdotjs, SiTailwindcss, SiPostgresql, SiMongodb } from 'react-icons/si';
import { useLanguage } from '../context/LanguageContext';
import './Skills.css';

const skillsData = [
    { name: 'React', icon: <FaReact />, color: '#61DAFB' },
    { name: 'Node.js', icon: <FaNodeJs />, color: '#339933' },
    { name: 'Python', icon: <FaPython />, color: '#3776AB' },
    { name: 'TypeScript', icon: <SiTypescript />, color: '#3178C6' },
    { name: 'Next.js', icon: <SiNextdotjs />, color: '#000000' },
    { name: 'Tailwind', icon: <SiTailwindcss />, color: '#06B6D4' },
    { name: 'Docker', icon: <FaDocker />, color: '#2496ED' },
    { name: 'AWS', icon: <FaAws />, color: '#FF9900' },
    { name: 'PostgreSQL', icon: <SiPostgresql />, color: '#4169E1' },
    { name: 'MongoDB', icon: <SiMongodb />, color: '#47A248' },
    { name: 'Figma', icon: <FaFigma />, color: '#F24E1E' },
    { name: 'HTML5', icon: <FaHtml5 />, color: '#E34F26' },
    { name: 'CSS3', icon: <FaCss3Alt />, color: '#1572B6' },
    { name: 'JavaScript', icon: <FaJs />, color: '#F7DF1E' },
];

const Skills = () => {
    const { t } = useLanguage();

    return (
        <section id="skills" className="section skills-section">
            <div className="container">
                <motion.h2
                    className="section-title"
                    initial={{ opacity: 0, y: 20 }}
                    whileInView={{ opacity: 1, y: 0 }}
                    viewport={{ once: true }}
                >
                    {t.skills.title}
                </motion.h2>

                <div className="skills-grid">
                    {skillsData.map((skill, index) => (
                        <motion.div
                            key={skill.name}
                            className="skill-card"
                            initial={{ opacity: 0, scale: 0.8 }}
                            whileInView={{ opacity: 1, scale: 1 }}
                            viewport={{ once: true }}
                            transition={{ delay: index * 0.05 }}
                            whileHover={{ y: -5 }}
                        >
                            <div className="skill-icon" style={{ color: skill.color }}>
                                {skill.icon}
                            </div>
                            <span className="skill-name">{skill.name}</span>
                        </motion.div>
                    ))}
                </div>
            </div>
        </section>
    );
};

export default Skills;
