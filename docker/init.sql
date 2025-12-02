-- Portfolio Database Initialization Script

-- Create chat_logs table
CREATE TABLE IF NOT EXISTS chat_logs (
    id INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_message TEXT NOT NULL,
    bot_response TEXT NOT NULL,
    ip_address VARCHAR(45),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Create testimonials table
CREATE TABLE IF NOT EXISTS testimonials (
    id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    lang VARCHAR(5) NOT NULL DEFAULT 'tr',
    name VARCHAR(50) NOT NULL,
    role VARCHAR(50),
    company VARCHAR(50),
    text TEXT NOT NULL,
    image VARCHAR(255),
    rating INT(1) DEFAULT 5,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Create blogs table
CREATE TABLE IF NOT EXISTS blogs (
    id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    lang VARCHAR(5) NOT NULL DEFAULT 'tr',
    title VARCHAR(255) NOT NULL,
    slug VARCHAR(255) NOT NULL,
    summary TEXT,
    content LONGTEXT,
    image VARCHAR(255),
    category VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- ==========================================
-- TESTIMONIALS (REFERANSLAR)
-- ==========================================

-- TR (Turkish)
INSERT INTO testimonials (lang, name, role, company, text, image) VALUES
('tr', 'Mehmet Yılmaz', 'CTO', 'TechCorp', 'Ahmet ile çalışmak harikaydı. Projemizi zamanında ve mükemmel kalitede teslim etti.', 'https://randomuser.me/api/portraits/men/32.jpg'),
('tr', 'Ayşe Demir', 'Ürün Müdürü', 'StartUp Inc', 'Yaratıcı çözümleri ve teknik bilgisiyle projemize değer kattı. Kesinlikle tavsiye ederim.', 'https://randomuser.me/api/portraits/women/44.jpg'),
('tr', 'Caner Erkin', 'Kurucu', 'Digital Agency', 'Hızlı, güvenilir ve profesyonel. Beklentilerimizin çok ötesinde bir iş çıkardı.', 'https://randomuser.me/api/portraits/men/85.jpg');

-- EN (English)
INSERT INTO testimonials (lang, name, role, company, text, image) VALUES
('en', 'John Doe', 'CTO', 'TechCorp', 'Working with Ahmet was great. He delivered our project on time and with excellent quality.', 'https://randomuser.me/api/portraits/men/32.jpg'),
('en', 'Jane Smith', 'Product Manager', 'StartUp Inc', 'Added value to our project with creative solutions and technical knowledge. Highly recommended.', 'https://randomuser.me/api/portraits/women/44.jpg'),
('en', 'Michael Brown', 'Founder', 'Digital Agency', 'Fast, reliable, and professional. Delivered work far beyond our expectations.', 'https://randomuser.me/api/portraits/men/85.jpg');

-- DE (German)
INSERT INTO testimonials (lang, name, role, company, text, image) VALUES
('de', 'Hans Müller', 'CTO', 'TechCorp', 'Die Zusammenarbeit mit Ahmet war großartig. Er hat unser Projekt pünktlich und in hervorragender Qualität geliefert.', 'https://randomuser.me/api/portraits/men/32.jpg'),
('de', 'Julia Weber', 'Produktmanagerin', 'StartUp Inc', 'Hat mit kreativen Lösungen und technischem Wissen einen Mehrwert für unser Projekt geschaffen. Absolut empfehlenswert.', 'https://randomuser.me/api/portraits/women/44.jpg'),
('de', 'Klaus Wagner', 'Gründer', 'Digital Agency', 'Schnell, zuverlässig und professionell. Hat eine Arbeit geleistet, die weit über unseren Erwartungen lag.', 'https://randomuser.me/api/portraits/men/85.jpg');

-- AR (Arabic)
INSERT INTO testimonials (lang, name, role, company, text, image) VALUES
('ar', 'أحمد حسن', 'المدير التقني', 'تيك كورب', 'كان العمل مع أحمد رائعًا. سلم مشروعنا في الوقت المحدد وبجودة ممتازة.', 'https://randomuser.me/api/portraits/men/32.jpg'),
('ar', 'ليلى محمود', 'مديرة المنتج', 'ستارت أب', 'أضاف قيمة لمشروعنا بحلوله الإبداعية ومعرفته التقنية. أوصي به بشدة.', 'https://randomuser.me/api/portraits/women/44.jpg'),
('ar', 'عمر خالد', 'المؤسس', 'وكالة رقمية', 'سريع وموثوق ومحترف. قدم عملاً يفوق توقعاتنا بكثير.', 'https://randomuser.me/api/portraits/men/85.jpg');

-- RU (Russian)
INSERT INTO testimonials (lang, name, role, company, text, image) VALUES
('ru', 'Дмитрий Волков', 'CTO', 'TechCorp', 'Работать с Ахметом было здорово. Он сдал наш проект вовремя и с отличным качеством.', 'https://randomuser.me/api/portraits/men/32.jpg'),
('ru', 'Елена Соколова', 'Менеджер продукта', 'StartUp Inc', 'Добавил ценность нашему проекту своими творческими решениями и техническими знаниями. Настоятельно рекомендую.', 'https://randomuser.me/api/portraits/women/44.jpg'),
('ru', 'Алексей Морозов', 'Основатель', 'Digital Agency', 'Быстро, надежно и профессионально. Сделал работу, превосходящую наши ожидания.', 'https://randomuser.me/api/portraits/men/85.jpg');

-- ==========================================
-- BLOGS (BLOG YAZILARI)
-- ==========================================

-- TR (Turkish)
INSERT INTO blogs (lang, title, slug, summary, content, image, category) VALUES
('tr', 'Modern Web Geliştirme Trendleri 2025', 'modern-web-gelistirme-2025', '2025 yılında web geliştirme dünyasında öne çıkan teknolojiler ve yaklaşımlar.', '# Modern Web Geliştirme Trendleri 2025\n\nTeknoloji dünyası hızla değişiyor. İşte 2025''te dikkat etmeniz gerekenler:\n\n1. **AI Destekli Kodlama:** Artık standart.\n2. **Serverless Mimariler:** Daha da yaygınlaşıyor.\n3. **WebAssembly:** Performans gerektiren işlerde JavaScript''in yerini alıyor.\n\nDetaylar yakında...', 'https://images.unsplash.com/photo-1498050108023-c5249f4df085?q=80&w=600&auto=format&fit=crop', 'Teknoloji'),
('tr', 'Antigravity ile Kodlama: Yapay Zekanın Geleceği', 'antigravity-ile-kodlama', 'Google''ın gelişmiş yapay zeka kodlama asistanı Antigravity''nin yeteneklerini ve geliştirme sürecini nasıl devrimleştirdiğini keşfedin.', '# Antigravity ile Kodlama\n\nYapay zeka kodlama asistanları artık sadece kod tamamlama yapmıyor. Antigravity gibi gelişmiş sistemler tüm projeleri yönetebiliyor.\n\n## Özellikler\n- Tam otonom kod yazma\n- Proje yönetimi\n- Hata düzeltme\n\nDetaylar yakında...', 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485?q=80&w=600&auto=format&fit=crop', 'Yapay Zeka');

-- EN (English)
INSERT INTO blogs (lang, title, slug, summary, content, image, category) VALUES
('en', 'Modern Web Development Trends 2025', 'modern-web-development-2025', 'Technologies and approaches standing out in the web development world in 2025.', '# Modern Web Development Trends 2025\n\nThe technology world is changing rapidly. Here is what you need to watch out for in 2025:\n\n1. **AI-Assisted Coding:** Now standard.\n2. **Serverless Architectures:** Becoming even more widespread.\n3. **WebAssembly:** Replacing JavaScript in performance-critical tasks.\n\nDetails coming soon...', 'https://images.unsplash.com/photo-1498050108023-c5249f4df085?q=80&w=600&auto=format&fit=crop', 'Technology'),
('en', 'Coding with Antigravity: The Future of AI', 'coding-with-antigravity', 'Exploring the capabilities of Google''s advanced AI coding assistant, Antigravity, and how it revolutionizes the development workflow.', '# Coding with Antigravity\n\nAI coding assistants now do more than just code completion. Advanced systems like Antigravity can manage entire projects.\n\n## Features\n- Fully autonomous code writing\n- Project management\n- Bug fixing\n\nDetails coming soon...', 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485?q=80&w=600&auto=format&fit=crop', 'Artificial Intelligence');

-- DE (German)
INSERT INTO blogs (lang, title, slug, summary, content, image, category) VALUES
('de', 'Moderne Webentwicklungstrends 2025', 'moderne-webentwicklungstrends-2025', 'Technologien und Ansätze, die 2025 in der Welt der Webentwicklung hervorstechen.', '# Moderne Webentwicklungstrends 2025\n\nDie Technologiewelt verändert sich rasant. Hier ist, worauf Sie 2025 achten müssen:\n\n1. **KI-gestütztes Coding:** Jetzt Standard.\n2. **Serverless-Architekturen:** Werden noch weiter verbreitet.\n3. **WebAssembly:** Ersetzt JavaScript bei leistungsintensiven Aufgaben.\n\nDetails folgen bald...', 'https://images.unsplash.com/photo-1498050108023-c5249f4df085?q=80&w=600&auto=format&fit=crop', 'Technologie'),
('de', 'Programmieren mit Antigravity: Die Zukunft der KI', 'programmieren-mit-antigravity', 'Entdecken Sie die Fähigkeiten von Googles fortschrittlichem KI-Coding-Assistenten Antigravity und wie er den Entwicklungsprozess revolutioniert.', '# Programmieren mit Antigravity\n\nKI-Coding-Assistenten machen jetzt mehr als nur Code-Vervollständigung. Fortgeschrittene Systeme wie Antigravity können ganze Projekte verwalten.\n\n## Funktionen\n- Vollautonomes Schreiben von Code\n- Projektmanagement\n- Fehlerbehebung\n\nDetails folgen bald...', 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485?q=80&w=600&auto=format&fit=crop', 'Künstliche Intelligenz');

-- AR (Arabic)
INSERT INTO blogs (lang, title, slug, summary, content, image, category) VALUES
('ar', 'اتجاهات تطوير الويب الحديثة 2025', 'modern-web-development-trends-2025-ar', 'التقنيات والمناهج التي تبرز في عالم تطوير الويب في عام 2025.', '# اتجاهات تطوير الويب الحديثة 2025\n\nعالم التكنولوجيا يتغير بسرعة. إليك ما تحتاج إلى الانتباه إليه في عام 2025:\n\n1. **البرمجة بمساعدة الذكاء الاصطناعي:** أصبحت الآن معيارًا.\n2. **البنى التحتية بدون خادم (Serverless):** أصبحت أكثر انتشارًا.\n3. **WebAssembly:** تحل محل JavaScript في المهام التي تتطلب أداءً عاليًا.\n\nالتفاصيل قريبا...', 'https://images.unsplash.com/photo-1498050108023-c5249f4df085?q=80&w=600&auto=format&fit=crop', 'تكنولوجيا'),
('ar', 'البرمجة مع Antigravity: مستقبل الذكاء الاصطناعي', 'coding-with-antigravity-ar', 'استكشاف قدرات مساعد البرمجة بالذكاء الاصطناعي المتقدم من Google، Antigravity، وكيف يحدث ثورة في سير عمل التطوير.', '# البرمجة مع Antigravity\n\nمساعدو البرمجة بالذكاء الاصطناعي يفعلون الآن أكثر من مجرد إكمال التعليمات البرمجية. يمكن للأنظمة المتقدمة مثل Antigravity إدارة مشاريع بأكملها.\n\n## الميزات\n- كتابة التعليمات البرمجية بشكل مستقل تمامًا\n- إدارة المشاريع\n- إصلاح الأخطاء\n\nالتفاصيل قريبا...', 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485?q=80&w=600&auto=format&fit=crop', 'الذكاء الاصطناعي');

-- RU (Russian)
INSERT INTO blogs (lang, title, slug, summary, content, image, category) VALUES
('ru', 'Тренды современной веб-разработки 2025', 'modern-web-development-trends-2025-ru', 'Технологии и подходы, выделяющиеся в мире веб-разработки в 2025 году.', '# Тренды современной веб-разработки 2025\n\nМир технологий быстро меняется. Вот на что нужно обратить внимание в 2025 году:\n\n1. **Кодинг с ИИ:** Теперь стандарт.\n2. **Бессерверные архитектуры:** Становятся еще более распространенными.\n3. **WebAssembly:** Заменяет JavaScript в задачах, требующих высокой производительности.\n\nПодробности скоро...', 'https://images.unsplash.com/photo-1498050108023-c5249f4df085?q=80&w=600&auto=format&fit=crop', 'Технологии'),
('ru', 'Программирование с Antigravity: Будущее ИИ', 'coding-with-antigravity-ru', 'Изучение возможностей передового ИИ-ассистента по программированию от Google, Antigravity, и того, как он революционизирует процесс разработки.', '# Программирование с Antigravity\n\nИИ-ассистенты теперь делают больше, чем просто автодополнение кода. Передовые системы, такие как Antigravity, могут управлять целыми проектами.\n\n## Особенности\n- Полностью автономное написание кода\n- Управление проектами\n- Исправление ошибок\n\nПодробности скоро...', 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485?q=80&w=600&auto=format&fit=crop', 'Искусственный Интеллект');
