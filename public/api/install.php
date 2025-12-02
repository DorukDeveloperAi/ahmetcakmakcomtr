<?php
include 'db.php';

try {
    // Drop existing tables to reset schema
    $conn->exec("DROP TABLE IF EXISTS testimonials");
    $conn->exec("DROP TABLE IF EXISTS blogs");

    // Testimonials Table with Language Support
    $sql = "CREATE TABLE testimonials (
        id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        lang VARCHAR(5) NOT NULL DEFAULT 'tr',
        name VARCHAR(50) NOT NULL,
        role VARCHAR(50),
        company VARCHAR(50),
        text TEXT NOT NULL,
        image VARCHAR(255),
        rating INT(1) DEFAULT 5,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci";
    $conn->exec($sql);

    // Blogs Table with Language Support
    $sql = "CREATE TABLE blogs (
        id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        lang VARCHAR(5) NOT NULL DEFAULT 'tr',
        title VARCHAR(255) NOT NULL,
        slug VARCHAR(255) NOT NULL,
        summary TEXT,
        content LONGTEXT,
        image VARCHAR(255),
        category VARCHAR(50),
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci";
    $conn->exec($sql);

    // Insert Testimonials (Turkish)
    $stmt = $conn->prepare("INSERT INTO testimonials (lang, name, role, company, text, image) VALUES (?, ?, ?, ?, ?, ?)");

    // TR
    $stmt->execute(["tr", "Mehmet Yılmaz", "CTO", "TechCorp", "Ahmet ile çalışmak harikaydı. Projemizi zamanında ve mükemmel kalitede teslim etti.", "https://randomuser.me/api/portraits/men/32.jpg"]);
    $stmt->execute(["tr", "Ayşe Demir", "Product Manager", "StartUp Inc", "Yaratıcı çözümleri ve teknik bilgisiyle projemize değer kattı. Kesinlikle tavsiye ederim.", "https://randomuser.me/api/portraits/women/44.jpg"]);
    $stmt->execute(["tr", "Caner Erkin", "Founder", "Digital Agency", "Hızlı, güvenilir ve profesyonel. Beklentilerimizin çok ötesinde bir iş çıkardı.", "https://randomuser.me/api/portraits/men/85.jpg"]);

    // EN
    $stmt->execute(["en", "John Doe", "CTO", "TechCorp", "Working with Ahmet was great. He delivered our project on time and with excellent quality.", "https://randomuser.me/api/portraits/men/32.jpg"]);
    $stmt->execute(["en", "Jane Smith", "Product Manager", "StartUp Inc", "Added value to our project with creative solutions and technical knowledge. Highly recommended.", "https://randomuser.me/api/portraits/women/44.jpg"]);
    $stmt->execute(["en", "Michael Brown", "Founder", "Digital Agency", "Fast, reliable, and professional. Delivered work far beyond our expectations.", "https://randomuser.me/api/portraits/men/85.jpg"]);


    // Insert Blogs
    $stmtBlog = $conn->prepare("INSERT INTO blogs (lang, title, slug, summary, content, image, category) VALUES (?, ?, ?, ?, ?, ?, ?)");

    // TR
    $stmtBlog->execute([
        "tr",
        "Modern Web Geliştirme Trendleri 2025",
        "modern-web-gelistirme-2025",
        "2025 yılında web geliştirme dünyasında öne çıkan teknolojiler ve yaklaşımlar.",
        "# Modern Web Geliştirme Trendleri 2025\n\nTeknoloji dünyası hızla değişiyor. İşte 2025'te dikkat etmeniz gerekenler:\n\n1. **AI Destekli Kodlama:** Artık standart.\n2. **Serverless Mimariler:** Daha da yaygınlaşıyor.\n3. **WebAssembly:** Performans gerektiren işlerde JavaScript'in yerini alıyor.\n\nDetaylar yakında...",
        "https://images.unsplash.com/photo-1498050108023-c5249f4df085?q=80&w=600&auto=format&fit=crop",
        "Teknoloji"
    ]);
    $stmtBlog->execute([
        "tr",
        "Neden React ve Vite?",
        "neden-react-ve-vite",
        "Projelerimde neden bu ikiliyi tercih ediyorum? Performans ve geliştirici deneyimi üzerine bir inceleme.",
        "# Neden React ve Vite?\n\nEskiden Create React App kullanırdık, ama artık Vite var. \n\n## Hız\nVite, native ES modules kullanarak inanılmaz hızlı bir geliştirme ortamı sunuyor.\n\n## Ekosistem\nReact ekosistemi ile mükemmel uyum sağlıyor.",
        "https://images.unsplash.com/photo-1633356122544-f134324a6cee?q=80&w=600&auto=format&fit=crop",
        "Yazılım"
    ]);

    // EN
    $stmtBlog->execute([
        "en",
        "Modern Web Development Trends 2025",
        "modern-web-development-2025",
        "Technologies and approaches standing out in the web development world in 2025.",
        "# Modern Web Development Trends 2025\n\nThe technology world is changing rapidly. Here is what you need to watch out for in 2025:\n\n1. **AI-Assisted Coding:** Now standard.\n2. **Serverless Architectures:** Becoming even more widespread.\n3. **WebAssembly:** Replacing JavaScript in performance-critical tasks.\n\nDetails coming soon...",
        "https://images.unsplash.com/photo-1498050108023-c5249f4df085?q=80&w=600&auto=format&fit=crop",
        "Technology"
    ]);
    $stmtBlog->execute([
        "en",
        "Why React and Vite?",
        "why-react-and-vite",
        "Why do I prefer this duo in my projects? A review on performance and developer experience.",
        "# Why React and Vite?\n\nWe used to use Create React App, but now there is Vite. \n\n## Speed\nVite offers an incredibly fast development environment using native ES modules.\n\n## Ecosystem\nIt integrates perfectly with the React ecosystem.",
        "https://images.unsplash.com/photo-1633356122544-f134324a6cee?q=80&w=600&auto=format&fit=crop",
        "Software"
    ]);

    echo json_encode(["message" => "Database setup completed successfully with Multi-Language support."]);

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(["error" => "Setup failed: " . $e->getMessage()]);
}
?>