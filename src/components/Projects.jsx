import React from 'react';
import { motion } from 'framer-motion';
import { FaGithub, FaExternalLinkAlt } from 'react-icons/fa';
import { useLanguage } from '../context/LanguageContext';
import './Projects.css';

const Projects = () => {
    const { t } = useLanguage();

    // Map static data to translation structure if needed, or just use t.projects.items directly
    // Since we put the data in translations.js, we can iterate over t.projects.items

    // We need to add the static image/tech data back to the items since it's not in translations
    // Or better, keep the structure in translations.js simple and merge it here.

    const staticProjectData = [
        {
            id: 1,
            tech: ['React', 'Node.js', 'MongoDB', 'Stripe'],
            image: 'https://via.placeholder.com/600x400/111/fff?text=E-Commerce',
            github: 'https://github.com',
            demo: 'https://demo.com'
        },
        {
            id: 2,
            tech: ['Python', 'FastAPI', 'React', 'OpenAI'],
            image: 'https://via.placeholder.com/600x400/111/fff?text=AI+Task+Manager',
            github: 'https://github.com',
            demo: 'https://demo.com'
        },
        {
            id: 3,
            tech: ['Vue.js', 'Firebase', 'D3.js'],
            image: 'https://via.placeholder.com/600x400/111/fff?text=Dashboard',
            github: 'https://github.com',
            demo: 'https://demo.com'
        }
    ];

    const projects = t.projects.items.map((item, index) => ({
        ...item,
        ...staticProjectData[index]
    }));

    return (
        <section id="projects" className="section projects-section">
            <div className="container">
                <motion.h2
                    className="section-title"
                    initial={{ opacity: 0, y: 20 }}
                    whileInView={{ opacity: 1, y: 0 }}
                    viewport={{ once: true }}
                >
                    {t.projects.title}
                </motion.h2>

                <div className="projects-grid">
                    {projects.map((project, index) => (
                        <motion.div
                            key={project.id}
                            className="project-card"
                            initial={{ opacity: 0, y: 30 }}
                            whileInView={{ opacity: 1, y: 0 }}
                            viewport={{ once: true }}
                            transition={{ delay: index * 0.1 }}
                        >
                            <div className="project-image">
                                <img src={project.image} alt={project.title} />
                                <div className="project-overlay">
                                    <div className="project-links">
                                        <a href={project.github} target="_blank" rel="noreferrer" aria-label="GitHub Repo">
                                            <FaGithub />
                                        </a>
                                        <a href={project.demo} target="_blank" rel="noreferrer" aria-label="Live Demo">
                                            <FaExternalLinkAlt />
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div className="project-content">
                                <h3 className="project-title">{project.title}</h3>
                                <p className="project-description">{project.description}</p>
                                <div className="project-tech">
                                    {project.tech.map((tech) => (
                                        <span key={tech} className="tech-tag">{tech}</span>
                                    ))}
                                </div>
                            </div>
                        </motion.div>
                    ))}
                </div>

                <div className="view-all-container">
                    <a href="#" className="btn btn-outline">{t.projects.viewAll}</a>
                </div>
            </div>
        </section>
    );
};

export default Projects;
