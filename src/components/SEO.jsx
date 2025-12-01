import React from 'react';
import { Helmet } from 'react-helmet-async';
import { useLanguage } from '../context/LanguageContext';

const SEO = () => {
    const { t, language } = useLanguage();
    const meta = t.meta;

    return (
        <Helmet>
            <html lang={language} />
            <title>{meta.title}</title>
            <meta name="description" content={meta.description} />
            <meta name="keywords" content={meta.keywords} />

            {/* Open Graph / Facebook */}
            <meta property="og:type" content="website" />
            <meta property="og:url" content="https://ahmetcakmak.com.tr/" />
            <meta property="og:title" content={meta.title} />
            <meta property="og:description" content={meta.description} />
            <meta property="og:image" content="https://ahmetcakmak.com.tr/images/ai_integration.png" />

            {/* Twitter */}
            <meta property="twitter:card" content="summary_large_image" />
            <meta property="twitter:url" content="https://ahmetcakmak.com.tr/" />
            <meta property="twitter:title" content={meta.title} />
            <meta property="twitter:description" content={meta.description} />
            <meta property="twitter:image" content="https://ahmetcakmak.com.tr/images/ai_integration.png" />

            <link rel="canonical" href="https://ahmetcakmak.com.tr/" />
        </Helmet>
    );
};

export default SEO;
