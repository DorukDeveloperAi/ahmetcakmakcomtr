# Profesyonel Geliştirici Portföyü (Professional Developer Portfolio)

React, Vite ve Framer Motion kullanılarak oluşturulmuş, çok dilli (Türkçe, İngilizce, Arapça) ve modern bir kişisel portföy web sitesi.

Canlı Demo: [ahmetcakmak.com.tr](http://ahmetcakmak.com.tr)

## 🚀 Özellikler (Features)

*   **Modern Teknoloji Yığını:** React 18, Vite, Framer Motion.
*   **Çoklu Dil Desteği (i18n):**
    *   Türkçe (TR), İngilizce (EN) ve Arapça (AR) desteği.
    *   Arapça için otomatik **RTL (Sağdan Sola)** düzen desteği.
    *   Bayraklı ve açılır menülü (dropdown) dil seçici.
    *   Dil tercihi tarayıcı hafızasında (localStorage) saklanır.
*   **Tasarım ve UI/UX:**
    *   **Karanlık/Aydınlık Mod (Dark/Light Mode):** Kullanıcı tercihine göre tema değiştirme.
    *   **Responsive Tasarım:** Mobil, tablet ve masaüstü cihazlarla tam uyumlu.
    *   **Animasyonlar:** Framer Motion ile akıcı sayfa geçişleri ve mikro etkileşimler.
    *   **Hero Bölümü:** "Code lines" arka plan efekti ve daktilo (typewriter) animasyonu.
*   **İçerik Yönetimi:**
    *   Merkezi dil dosyası (`src/data/translations.js`) üzerinden kolay içerik yönetimi.
    *   Dinamik proje ve yetenek kartları.
*   **Otomatik Dağıtım (Deployment):**
    *   FTP üzerinden sunucuya otomatik yükleme betiği (`deploy.js`).

## 🛠️ Kurulum ve Çalıştırma (Installation)

1.  **Depoyu klonlayın:**
    ```bash
    git clone https://github.com/KULLANICI_ADI/developer-portfolio.git
    cd developer-portfolio
    ```

2.  **Bağımlılıkları yükleyin:**
    ```bash
    npm install
    ```

3.  **Geliştirme sunucusunu başlatın:**
    ```bash
    npm run dev
    ```

4.  **Üretim için derleyin (Build):**
    ```bash
    npm run build
    ```

5.  **Sunucuya Yükle (FTP):**
    `deploy.js` dosyasındaki FTP bilgilerini düzenledikten sonra:
    ```bash
    node deploy.js
    ```

## 📂 Proje Yapısı

*   `src/components`: Hero, Navbar, Projects, Skills vb. bileşenler.
*   `src/context`: Dil ve tema yönetimi için Context API (LanguageContext).
*   `src/data`: Çeviri metinleri ve sabit veriler.
*   `public`: Statik dosyalar.

## 👤 Geliştirici

**Ahmet ÇAKMAK**
*   Full Stack Geliştirici
*   Yapay Zeka & Makine Öğrenimi Meraklısı

---
© 2024 Ahmet ÇAKMAK. Tüm hakları saklıdır.
