import React from 'react';
import { motion } from 'framer-motion';
import { FaGithub, FaExternalLinkAlt } from 'react-icons/fa';
import { useLanguage } from '../context/LanguageContext';
import './Projects.css';

const Projects = () => {
    const { t } = useLanguage();
    const [width, setWidth] = React.useState(0);
    const carousel = React.useRef();

    React.useEffect(() => {
        if (carousel.current) {
            setWidth(carousel.current.scrollWidth - carousel.current.offsetWidth);
        }
    }, [t.projects.items]); // Recalculate when items change

    const staticProjectData = [
        {
            id: 1,
            tech: ['HTML5', 'CSS3', 'React', 'SEO'],
            image: 'https://images.unsplash.com/photo-1460925895917-afdab827c52f?q=80&w=2426&auto=format&fit=crop',
            github: 'https://github.com',
            demo: 'https://demo.com'
        },
        {
            id: 2,
            tech: ['Python', 'Django', 'React', 'PostgreSQL'],
            image: 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?q=80&w=2670&auto=format&fit=crop',
            github: 'https://github.com',
            demo: 'https://demo.com'
        },
        {
            id: 3,
            tech: ['Node.js', 'Analytics', 'API', 'Dashboard'],
            image: 'https://images.unsplash.com/photo-1611926653458-09294b3142bf?q=80&w=2670&auto=format&fit=crop',
            github: 'https://github.com',
            demo: 'https://demo.com'
        },
        {
            id: 4,
            tech: ['Hardware', 'Network', 'Server', 'Security'],
            image: '/images/hardware_consultancy.png',
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

                <div className="projects-marquee-container">
                    <div className="projects-marquee">
                        <div className="projects-track">
                            {[...projects, ...projects, ...projects].map((project, index) => (
                                <div
                                    key={`${project.id}-${index}`}
                                    className="project-card"
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
                                </div>
                            ))}
                        </div>
                    </div>
                </div>

                <div className="view-all-container">
                    <a href="#" className="btn btn-outline">{t.projects.viewAll}</a>
                </div>
            </div>
        </section>
    );
};

export default Projects;
