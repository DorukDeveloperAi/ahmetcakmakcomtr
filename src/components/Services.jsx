import React from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { FaGithub, FaExternalLinkAlt, FaChevronLeft, FaChevronRight } from 'react-icons/fa';
import { useLanguage } from '../context/LanguageContext';
import './Services.css';

const Services = () => {
    const { t } = useLanguage();
    const scrollContainer = React.useRef(null);
    const [isHovered, setIsHovered] = React.useState(false);
    const [showAllServices, setShowAllServices] = React.useState(false);

    const toggleAllServices = () => {
        setShowAllServices(!showAllServices);
    };

    const staticProjectData = [
        {
            id: 1,
            tech: ['HTML5', 'CSS3', 'React', 'SEO'],
            image: 'https://images.unsplash.com/photo-1460925895917-afdab827c52f?q=80&w=2426&auto=format&fit=crop',
            github: 'https://github.com',
            demo: 'https://ahmetcakmak.com.tr'
        },
        {
            id: 2,
            tech: ['Python', 'Django', 'React', 'PostgreSQL'],
            image: 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?q=80&w=2670&auto=format&fit=crop',
            github: 'https://github.com',
            demo: 'https://ahmetcakmak.com.tr'
        },
        {
            id: 3,
            tech: ['Node.js', 'Analytics', 'API', 'Dashboard'],
            image: 'https://images.unsplash.com/photo-1611926653458-09294b3142bf?q=80&w=2670&auto=format&fit=crop',
            github: 'https://github.com',
            demo: 'https://ahmetcakmak.com.tr'
        },
        {
            id: 4,
            tech: ['Hardware', 'Network', 'Server', 'Security'],
            image: '/images/hardware_consultancy.png',
            github: 'https://github.com',
            demo: 'https://ahmetcakmak.com.tr'
        },
        {
            id: 5,
            tech: ['AI', 'LLM', 'Automation', 'Python'],
            image: '/images/ai_integration.png',
            github: 'https://github.com',
            demo: 'https://ahmetcakmak.com.tr'
        }
    ];

    const projects = t.projects.items.map((item, index) => ({
        ...item,
        ...staticProjectData[index]
    }));

    // Auto-scroll functionality
    React.useEffect(() => {
        const scroll = () => {
            if (scrollContainer.current && !isHovered) {
                scrollContainer.current.scrollLeft += 1;

                // Reset scroll for infinite loop effect
                if (scrollContainer.current.scrollLeft >= (scrollContainer.current.scrollWidth - scrollContainer.current.clientWidth)) {
                    scrollContainer.current.scrollLeft = 0;
                }
            }
        };

        const intervalId = setInterval(scroll, 20);
        return () => clearInterval(intervalId);
    }, [isHovered]);

    const scrollLeft = () => {
        if (scrollContainer.current) {
            scrollContainer.current.scrollBy({ left: -350, behavior: 'smooth' });
        }
    };

    const scrollRight = () => {
        if (scrollContainer.current) {
            scrollContainer.current.scrollBy({ left: 350, behavior: 'smooth' });
        }
    };

    return (
        <section id="services" className="section projects-section">
            <div className="container">
                <motion.h2
                    className="section-title"
                    initial={{ opacity: 0, y: 20 }}
                    whileInView={{ opacity: 1, y: 0 }}
                    viewport={{ once: true }}
                >
                    {t.projects.title}
                </motion.h2>

                <div className="projects-carousel-wrapper"
                    onMouseEnter={() => setIsHovered(true)}
                    onMouseLeave={() => setIsHovered(false)}>

                    <button className="nav-btn prev-btn" onClick={scrollLeft} aria-label="Previous">
                        <FaChevronLeft />
                    </button>

                    <div className="projects-scroll-container" ref={scrollContainer}>
                        <div className="projects-track">
                            {/* Duplicate projects for infinite scroll illusion */}
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

                    <button className="nav-btn next-btn" onClick={scrollRight} aria-label="Next">
                        <FaChevronRight />
                    </button>
                </div>

                <div className="all-services-section">
                    <div className="services-categories">
                        {t.projects.allServicesList && t.projects.allServicesList.map((category, index) => (
                            <div key={index} className="service-category">
                                <h4>{category.category}</h4>
                                <ul>
                                    {category.items.map((item, idx) => (
                                        <li key={idx}>{item}</li>
                                    ))}
                                </ul>
                            </div>
                        ))}
                    </div>
                </div>

                <div className="consultancy-cta">
                    <div className="consultancy-image">
                        <img src="https://images.unsplash.com/photo-1552664730-d307ca884978?q=80&w=2670&auto=format&fit=crop" alt="Consultancy" />
                    </div>
                    <div className="consultancy-content">
                        <p className="consultancy-text">
                            {t.projects.consultancyCTA.text}
                        </p>
                    </div>
                    <div className="consultancy-action">
                        <a href="#contact" className="consultancy-btn">
                            {t.projects.consultancyCTA.btn}
                        </a>
                    </div>
                </div>
            </div>
        </section>
    );
};

export default Services;
