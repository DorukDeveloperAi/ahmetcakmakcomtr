# 🚀 Developer Portfolio & Blog - v1.2.0

## 📝 Sürüm Notları
**Tarih:** 02.12.2025
**Sürüm:** 1.2.0
- **Veritabanı Entegrasyonu:** Tamamlandı. MySQL veritabanı Docker üzerinde ve canlı sunucuda senkronize edildi.
- **Otomatik Dağıtım:** `sunucuya-gonder.ps1` ile tek tıkla build ve FTP upload süreci, `deploy-database.php` ile veritabanı şeması güncelleme özelliği eklendi.
- **AI Chat Widget:** Ziyaretçilerle etkileşim kuran yapay zeka destekli sohbet botu eklendi.
- **Blog & Referanslar:** Dinamik içerik yönetimi için veritabanı tabloları ve API uçları oluşturuldu.
- **Çoklu Dil Desteği:** TR, EN, DE, RU, AR dilleri için altyapı güçlendirildi.

---

## 🛠️ Gereksinimler (Kurulması Gerekenler)
Projeyi yerel ortamda çalıştırmak ve geliştirmek için aşağıdaki yazılımların bilgisayarınızda kurulu olması gerekir:

1.  **Node.js** (v18 veya üzeri) - Paket yönetimi ve build işlemleri için.
2.  **Docker Desktop** - İzole geliştirme ortamı (PHP, Apache, MySQL) için.
3.  **Visual Studio Code** - Önerilen kod editörü.
4.  **Git** - Versiyon kontrolü için.
5.  **PowerShell** - Otomasyon scriptlerini çalıştırmak için (Windows'ta varsayılan).

---

## 💻 Kullanılan Teknolojiler

### Frontend
- **HTML5 & CSS3:** Modern, semantik ve responsive tasarım.
- **JavaScript (ES6+):** Modüler yapı, dinamik etkileşimler.
- **Vite:** Hızlı geliştirme sunucusu ve optimize edilmiş build aracı.
- **Bootstrap 5:** Grid sistemi ve hazır bileşenler (özelleştirilmiş).

### Backend
- **PHP 8.2:** Sunucu taraflı mantık ve API yönetimi.
- **MySQL 8.0:** İlişkisel veritabanı yönetimi.
- **RESTful API:** Frontend ve veritabanı iletişimi için JSON tabanlı servisler.

### DevOps & Araçlar
- **Docker & Docker Compose:** Konteynerizasyon.
- **Basic-FTP:** Node.js tabanlı FTP dağıtım kütüphanesi.
- **PowerShell Scripting:** Otomasyon süreçleri.

---

## ✨ Site Özellikleri

1.  **Dinamik İçerik Yönetimi:**
    *   **Blog Sistemi:** Veritabanından çekilen makaleler.
    *   **Referanslar (Testimonials):** Müşteri yorumları modülü.
2.  **Yapay Zeka Asistanı (AI Chat):**
    *   Kullanıcı sorularını yanıtlayan akıllı bot.
    *   Konuşma geçmişi kaydı (`chat_logs`).
    *   Bilgi tabanı yönetimi (`chat_knowledge_base`).
3.  **Çoklu Dil Desteği:**
    *   5 farklı dil seçeneği (Türkçe, İngilizce, Almanca, Rusça, Arapça).
    *   Otomatik dil algılama ve geçiş.
4.  **İletişim Formu:**
    *   SMTP üzerinden e-posta gönderimi.
    *   Form validasyonu.
5.  **Responsive Tasarım:**
    *   Mobil, tablet ve masaüstü uyumlu arayüz.
    *   Karanlık/Aydınlık mod (altyapısı hazır).

---

## 🗺️ Site Haritası

- **Ana Sayfa (/)**
    - Hero Bölümü (Giriş)
    - Hakkımda
    - Hizmetler
    - Yetenekler
    - Referanslar
    - Blog Özetleri
    - İletişim
- **Blog Detay Sayfaları** (`/blog/slug`)
- **Yönetim Araçları** (Erişim Kısıtlı)
    - `/db-deploy/deploy-database.php` (Veritabanı kurulumu)
    - `/api/db.php` (Veritabanı bağlantı testi)

---

## 📜 Yapılan İşlemler (Changelog)

Proje geliştirme sürecinde gerçekleştirilen adımlar:

1.  **Proje Başlangıcı:** Vite ile vanilla JavaScript projesi oluşturuldu.
2.  **Tasarım Uyarlaması:** HTML/CSS yapısı modern UI trendlerine göre kodlandı.
3.  **Docker Ortamının Kurulması:**
    *   `Dockerfile` ve `docker-compose.yml` hazırlandı.
    *   PHP-Apache ve MySQL servisleri ayağa kaldırıldı.
    *   phpMyAdmin entegre edildi.
4.  **Veritabanı Mimarisi:**
    *   `init.sql` ile veritabanı şeması oluşturuldu.
    *   Tablolar: `chat_logs`, `chat_knowledge_base`, `testimonials`, `blogs`.
5.  **Backend Geliştirmesi:**
    *   PHP ile veritabanı bağlantı katmanı (`db.php`) yazıldı.
    *   Docker ve Prodüksiyon ortamlarını tanıyan dinamik bağlantı yapısı kuruldu.
6.  **Otomasyon Scriptleri:**
    *   `deploy.js`: FTP üzerinden dosya yükleme.
    *   `deploy-database.js` & `.php`: Veritabanı senkronizasyonu.
    *   `sunucuya-gonder.ps1`: Tek komutla tüm deploy sürecini yönetme.
7.  **Hata Düzeltmeleri ve İyileştirmeler:**
    *   XAMPP bağımlılığı kaldırıldı, tamamen Docker'a geçildi.
    *   FTP bağlantı sorunları ve dosya izinleri çözüldü.
    *   Veritabanı karakter seti (UTF-8) sorunları giderildi.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## 📌 Önemli Notlar ve İpuçları (Unutulanlar)

### 📂 Dosya Yapısı
```
/
├── public/             # Statik dosyalar (resimler, favicon vb.)
├── src/                # Kaynak kodlar (JS, CSS)
├── docker/             # Docker yapılandırma ve SQL dosyaları
├── dist/               # Build sonrası oluşan üretim dosyaları
├── .env                # (Opsiyonel) Hassas veriler için ortam değişkenleri
└── ...
```

### 🔐 Güvenlik Uyarısı
*   `deploy-database.php` dosyası sunucuda veritabanını sıfırlama yetkisine sahiptir. Deploy işleminden sonra sunucudan silinmesi veya erişime kapatılması önerilir.
*   Veritabanı şifreleri kod içinde hardcoded (gömülü) durumdadır. İlerleyen aşamada `.env` dosyasına taşınmalıdır.

### 🚀 Nasıl Geliştirme Yapılır?
1.  `docker-compose up -d` ile ortamı başlatın.
2.  `http://localhost:8080` adresinden siteyi görüntüleyin.
3.  Kod değişikliklerini yapın.
4.  `npm run build` ile derleyin.
5.  Değişiklikleri görmek için `docker-compose restart web` yapın (PHP dosyaları için) veya tarayıcıyı yenileyin (JS/CSS için).

### 📄 Lisans
Bu proje kişisel portfolyo amaçlı hazırlanmıştır. İzinsiz ticari kullanımı kısıtlı olabilir.
