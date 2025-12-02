<?php
include 'db.php';

header('Content-Type: application/json; charset=utf-8');
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

try {
    // 1. Tabloyu Temizle (DELETE FROM kullanıyoruz, TRUNCATE yetkisi olmayabilir)
    $conn->exec("DELETE FROM chat_knowledge_base");

    // Auto increment sıfırlama (opsiyonel, hata verirse try-catch ile yutulabilir)
    try {
        $conn->exec("ALTER TABLE chat_knowledge_base AUTO_INCREMENT = 1");
    } catch (Exception $e) {
        // Ignore auto increment reset error
    }

    echo "Tablo temizlendi.\n";

    // 2. Verileri Hazırla
    $data = [
        // --- TÜRKÇE (TR) ---

        // Genel / Kimdir
        [
            'keywords' => 'kimsin,sen kimsin,ahmet kim,ahmet cakmak kimdir,kendini tanit',
            'answer' => 'Ben Ahmet Çakmak\'ın yapay zeka asistanıyım. Ahmet, 10 yılı aşkın deneyime sahip bir Bilgi İşlem Uzmanı ve Full Stack Geliştiricidir. Kocaeli Üniversitesi Bilgisayar Öğretmenliği mezunudur.',
            'lang' => 'tr',
            'category' => 'about'
        ],
        [
            'keywords' => 'ne is yapiyorsun,meslegin ne,uzmanlik alanin',
            'answer' => 'Bilgi İşlem Uzmanı ve Full Stack Geliştirici olarak çalışıyorum. Web geliştirme, sistem yönetimi, ERP/CRM çözümleri ve yapay zeka entegrasyonları konusunda uzmanım.',
            'lang' => 'tr',
            'category' => 'about'
        ],

        // Eğitim
        [
            'keywords' => 'egitim,okul,universite,hangi bolum,mezuniyet',
            'answer' => 'Kocaeli Üniversitesi Bilgisayar Öğretmenliği bölümü mezunuyum.',
            'lang' => 'tr',
            'category' => 'education'
        ],

        // Deneyim / İş Geçmişi
        [
            'keywords' => 'deneyim,tecrube,is gecmisi,nerede calistin,hangi firmalar',
            'answer' => '10+ yıllık deneyimim var. Şu anda Özel Doruk Nilüfer Hastanesi\'nde Bilgi İşlem Uzmanı olarak çalışıyorum. Daha önce Motif Mensucat, Hamzagil Emprime ve Ente Tanıtım firmalarında görev aldım.',
            'lang' => 'tr',
            'category' => 'experience'
        ],
        [
            'keywords' => 'su an nerede calisiyorsun,mevcut isin,calisiyor musun',
            'answer' => 'Şu anda Özel Doruk Nilüfer Hastanesi\'nde Bilgi İşlem Uzmanı olarak çalışmaktayım. Ayrıca freelance projelere de açığım.',
            'lang' => 'tr',
            'category' => 'experience'
        ],

        // Hizmetler - Genel
        [
            'keywords' => 'hizmetler,neler yapiyorsun,ne sunuyorsun,servisler',
            'answer' => 'Sunduğum başlıca hizmetler: Web Site Danışmanlığı, ERP & CRM Çözümleri, Sosyal Medya Yönetimi, BT Altyapı Danışmanlığı ve Yapay Zeka Entegrasyonu.',
            'lang' => 'tr',
            'category' => 'services'
        ],

        // Hizmetler - Web
        [
            'keywords' => 'web sitesi,internet sitesi,web tasarim,kurumsal site,site yaptirmak',
            'answer' => 'Modern, responsive (mobil uyumlu) ve SEO dostu kurumsal web siteleri geliştiriyorum. İhtiyacınıza özel çözümler sunabilirim.',
            'lang' => 'tr',
            'category' => 'services'
        ],

        // Hizmetler - Mobil
        [
            'keywords' => 'mobil uygulama,android,ios,app,uygulama gelistirme',
            'answer' => 'React Native ve Capacitor teknolojileri ile hem iOS hem de Android için çalışabilen mobil uygulamalar geliştiriyorum.',
            'lang' => 'tr',
            'category' => 'services'
        ],

        // Hizmetler - SEO
        [
            'keywords' => 'seo,arama motoru,google siralamasi,seo danismanligi',
            'answer' => 'Web sitenizin arama motorlarında üst sıralarda yer alması için SEO (Arama Motoru Optimizasyonu) danışmanlığı veriyorum.',
            'lang' => 'tr',
            'category' => 'services'
        ],

        // Hizmetler - ERP/CRM
        [
            'keywords' => 'erp,crm,yazilim,ozel yazilim,is takibi,musteri takibi',
            'answer' => 'İş süreçlerinizi ve müşteri ilişkilerinizi yönetebileceğiniz web tabanlı özel ERP ve CRM yazılımları geliştiriyorum.',
            'lang' => 'tr',
            'category' => 'services'
        ],

        // Hizmetler - AI
        [
            'keywords' => 'yapay zeka,ai,otomasyon,chatgpt entegrasyonu,llm',
            'answer' => 'İş süreçlerinizi otomatize etmek ve verimliliği artırmak için yapay zeka modellerini (LLM) sistemlerinize entegre ediyorum.',
            'lang' => 'tr',
            'category' => 'services'
        ],

        // İletişim
        [
            'keywords' => 'iletisim,mail,telefon,adres,nasil ulasirim',
            'answer' => 'Bana sitedeki iletişim formundan veya ahmet@example.com mail adresinden ulaşabilirsiniz. En kısa sürede dönüş yaparım!',
            'lang' => 'tr',
            'category' => 'contact'
        ],
        [
            'keywords' => 'freelance,is aliyor musun,musaitlik,proje',
            'answer' => 'Evet, şu anda freelance işler için uygunum ve yeni projelere açığım. Detayları konuşmak için iletişime geçebilirsiniz.',
            'lang' => 'tr',
            'category' => 'contact'
        ],

        // Fiyat
        [
            'keywords' => 'fiyat,ucret,kac para,ne kadar,butce',
            'answer' => 'Fiyatlandırma projenin kapsamına, özelliklerine ve süresine göre değişmektedir. Detaylı bir teklif için lütfen projenizden bahsedin.',
            'lang' => 'tr',
            'category' => 'pricing'
        ],

        // Teknolojiler
        [
            'keywords' => 'teknolojiler,hangi diller,kullandigin programlar,tech stack',
            'answer' => 'Genellikle React, Node.js, PHP, Python, MySQL/MSSQL, Docker ve Git teknolojilerini kullanıyorum.',
            'lang' => 'tr',
            'category' => 'tech'
        ],


        // --- ENGLISH (EN) ---

        // General / Who is
        [
            'keywords' => 'who are you,who is ahmet,tell me about yourself',
            'answer' => 'I am Ahmet\'s AI assistant. Ahmet is an IT Specialist and Full Stack Developer with over 10 years of experience. He is a graduate of Kocaeli University Computer Education.',
            'lang' => 'en',
            'category' => 'about'
        ],
        [
            'keywords' => 'what do you do,profession,job',
            'answer' => 'I work as an IT Specialist and Full Stack Developer. I specialize in web development, system administration, ERP/CRM solutions, and AI integration.',
            'lang' => 'en',
            'category' => 'about'
        ],

        // Experience
        [
            'keywords' => 'experience,work history,companies,where did you work',
            'answer' => 'I have 10+ years of experience. Currently working at Private Doruk Nilüfer Hospital as an IT Specialist. Previously worked at Motif Mensucat, Hamzagil Emprime, and Ente Tanıtım.',
            'lang' => 'en',
            'category' => 'experience'
        ],

        // Services
        [
            'keywords' => 'services,what do you offer,consultancy',
            'answer' => 'My main services include: Website Consultancy, ERP & CRM Solutions, Social Media Management, IT Infrastructure Consultancy, and AI Integration.',
            'lang' => 'en',
            'category' => 'services'
        ],
        [
            'keywords' => 'web development,website,web design',
            'answer' => 'I develop modern, responsive, and SEO-friendly corporate websites tailored to your needs.',
            'lang' => 'en',
            'category' => 'services'
        ],
        [
            'keywords' => 'mobile app,android,ios,application',
            'answer' => 'I develop cross-platform mobile applications for both iOS and Android using React Native and Capacitor.',
            'lang' => 'en',
            'category' => 'services'
        ],

        // Contact
        [
            'keywords' => 'contact,email,phone,reach out',
            'answer' => 'You can reach me via the contact form on the site or email at ahmet@example.com. I\'ll get back to you as soon as possible!',
            'lang' => 'en',
            'category' => 'contact'
        ],
        [
            'keywords' => 'freelance,available,hiring',
            'answer' => 'Yes, I am currently available for freelance work and open to new opportunities. Feel free to contact me to discuss your project.',
            'lang' => 'en',
            'category' => 'contact'
        ],

        // Pricing
        [
            'keywords' => 'price,cost,how much,budget,quote',
            'answer' => 'Pricing depends on the project scope, features, and timeline. Please contact me for a detailed quote.',
            'lang' => 'en',
            'category' => 'pricing'
        ],

        // Tech
        [
            'keywords' => 'technologies,stack,programming languages,skills',
            'answer' => 'I mostly use React, Node.js, PHP, Python, MySQL/MSSQL, Docker, and Git.',
            'lang' => 'en',
            'category' => 'tech'
        ]
    ];

    // 3. Verileri Ekle
    $stmt = $conn->prepare("INSERT INTO chat_knowledge_base (keywords, answer, lang, category) VALUES (?, ?, ?, ?)");

    $count = 0;
    foreach ($data as $row) {
        $stmt->execute([
            $row['keywords'],
            $row['answer'],
            $row['lang'],
            $row['category']
        ]);
        $count++;
    }

    echo "Başarıyla $count adet kayıt eklendi.";

} catch (PDOException $e) {
    http_response_code(500);
    echo "Hata: " . $e->getMessage();
}
?>