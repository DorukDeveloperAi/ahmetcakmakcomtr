# Profesyonel Geliştirici Portföyü (Professional Developer Portfolio)

React, Vite ve Framer Motion kullanılarak oluşturulmuş, çok dilli (Türkçe, İngilizce, Arapça, Almanca, Rusça) ve modern bir kişisel portföy web sitesi. Web, iOS ve Android platformlarında kullanılabilir.

**Canlı Demo:** [ahmetcakmak.com.tr](http://ahmetcakmak.com.tr)

## 📱 Mobil Uygulamalar

**İndir:**
- 🍎 [iOS App (IPA)](https://ahmetcakmak.com.tr/downloads/App.ipa)
- 📱 [Android App (APK)](https://ahmetcakmak.com.tr/downloads/AhmetCakmakPortfolio.apk)

*Not: iOS uygulaması imzasız olduğu için sadece geliştirici cihazlarına yüklenebilir. Android uygulaması için "Bilinmeyen Kaynaklardan Yükleme" seçeneğini aktifleştirmeniz gerekebilir.*

## 🚀 Özellikler (Features)

### Web Özellikleri
*   **Modern Teknoloji Yığını:** React 19, Vite 7, Framer Motion, Capacitor.
*   **Çoklu Dil Desteği (i18n):**
    *   **5 Dil Desteği:** Türkçe (TR), İngilizce (EN), Arapça (AR), Almanca (DE) ve Rusça (RU).
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

### Mobil Uygulama Özellikleri
*   **Cross-Platform:** Capacitor kullanılarak web kodundan iOS ve Android uygulamaları oluşturuldu.
*   **Otomatik Derleme:** GitHub Actions ile her push'ta otomatik iOS ve Android build.
*   **Otomatik Dağıtım:** Derlenmiş uygulamalar otomatik olarak FTP ile sunucuya yüklenir.

## 🛠️ Kurulum ve Çalıştırma (Installation)

### 🐳 Docker ile Local Development (ÖNERİLEN)

1. **Docker Desktop'ın çalıştığından emin olun**

2. **Container'ları başlatın:**
    ```bash
    docker-compose up -d
    ```

3. **Projeye erişin:**
    - Portfolio: http://localhost:8080
    - phpMyAdmin: http://localhost:8081

Detaylı bilgi için: `DOCKER_README.md`

### ⚡ Hızlı Komutlar

```powershell
# 🌐 Sunucuya gönder (Production deploy)
.\sunucuya-gonder.ps1

# 🐙 GitHub'a gönder (Version control)
.\github-gonder.ps1

# 🏠 Local geliştirme
docker-compose up -d
npm run build
docker-compose restart web
```

**📖 Detaylı workflow rehberi:** `WORKFLOW.md`

### Web Geliştirme (Alternatif)

1.  **Depoyu klonlayın:**
    ```bash
    git clone https://github.com/DorukDeveloperAi/ahmetcakmakcomtr.git
    cd ahmetcakmakcomtr
    ```

2.  **Bağımlılıkları yükleyin:**
    ```bash
    npm install --legacy-peer-deps
    ```

3.  **Geliştirme sunucusunu başlatın:**
    ```bash
    npm run dev
    ```

4.  **Üretim için derleyin (Build):**
    ```bash
    npm run build
    ```

### Mobil Uygulama Geliştirme

1.  **Android için:**
    ```bash
    npx cap add android
    npx cap sync android
    cd android
    ./gradlew assembleRelease
    ```

2.  **iOS için (macOS gerektirir):**
    ```bash
    npx cap add ios
    npx cap sync ios
    cd ios/App
    xcodebuild -workspace App.xcworkspace -scheme App archive
    ```

## 🤖 CI/CD ve Otomasyonlar

### GitHub Actions Workflows

Projede iki otomatik workflow bulunmaktadır:

#### 1. Android Build (`.github/workflows/android-build.yml`)
- **Tetikleme:** Her `master` branch'e push veya manuel tetikleme
- **İşlemler:**
  - Node.js 22 ve Java 21 kurulumu
  - Bağımlılıkları yükleme (`--legacy-peer-deps`)
  - Web projesini derleme (`npm run build`)
  - Capacitor Android platformunu ekleme/senkronizasyon
  - Gradle ile Release APK oluşturma
  - APK'yı FTP ile sunucuya yükleme (`downloads/AhmetCakmakPortfolio.apk`)

#### 2. iOS Build (`.github/workflows/ios-build.yml`)
- **Tetikleme:** Her `master` branch'e push veya manuel tetikleme
- **İşlemler:**
  - macOS runner üzerinde çalışır
  - Node.js 22 kurulumu
  - Bağımlılıkları yükleme
  - Web projesini derleme
  - Capacitor iOS platformunu ekleme/senkronizasyon
  - Xcode ile unsigned IPA oluşturma
  - IPA'yı FTP ile sunucuya yükleme (`downloads/App.ipa`)

### GitHub Secrets Yapılandırması

Workflow'ların çalışması için aşağıdaki secrets ayarlanmalıdır:
- `FTP_SERVER`: FTP sunucu adresi
- `FTP_USERNAME`: FTP kullanıcı adı
- `FTP_PASSWORD`: FTP şifresi

Secrets'ları eklemek için:
```bash
gh secret set FTP_SERVER
gh secret set FTP_USERNAME
gh secret set FTP_PASSWORD
```

## 📂 Proje Yapısı

```
├── .github/
│   └── workflows/          # GitHub Actions workflow dosyaları
│       ├── android-build.yml
│       └── ios-build.yml
├── src/
│   ├── components/         # React bileşenleri
│   ├── context/           # Context API (LanguageContext)
│   ├── data/              # Çeviri dosyaları ve sabit veriler
│   └── assets/            # Görseller ve statik dosyalar
├── public/                # Public statik dosyalar
├── android/               # Android native projesi (Capacitor)
├── ios/                   # iOS native projesi (Capacitor)
├── dist/                  # Build çıktıları
├── capacitor.config.ts    # Capacitor yapılandırması
└── deploy.js              # FTP deployment betiği
```

## 📝 Güncellemeler (Changelog)

### [01.12.2025] - Mobil Uygulama Desteği ve CI/CD

#### Yeni Özellikler
*   **Mobil Uygulama:**
    *   Capacitor entegrasyonu ile iOS ve Android uygulamaları oluşturuldu.
    *   Cross-platform yapı sayesinde tek kod tabanından her iki platform için build alınabiliyor.
    
*   **CI/CD Pipeline:**
    *   GitHub Actions ile otomatik iOS build workflow'u eklendi.
    *   GitHub Actions ile otomatik Android build workflow'u eklendi.
    *   Her push işleminde otomatik derleme ve FTP'ye yükleme.
    *   GitHub Secrets ile güvenli FTP kimlik bilgileri yönetimi.

*   **Otomatik Dağıtım:**
    *   Derlenmiş IPA ve APK dosyaları otomatik olarak sunucuya yükleniyor.
    *   İndirilebilir mobil uygulama linkleri README'ye eklendi.

#### Teknik İyileştirmeler
*   Node.js 22 ve Java 21 gereksinimleri karşılandı.
*   Gradle izin sorunları düzeltildi (`chmod +x gradlew`).
*   FTP upload path'i düzeltildi (istenmeyen `public_html` klasörü oluşturma sorunu çözüldü).
*   iOS platformu için koşullu ekleme mantığı (`if [ ! -d "ios" ]`).
*   Android platformu için koşullu ekleme mantığı (`if [ ! -d "android" ]`).

#### Hata Düzeltmeleri
*   Xcode build komut söz dizimi hatası düzeltildi (`-configuration Release -sdk iphoneos`).
*   Java source release versiyonu uyumsuzluğu giderildi (17 → 21).
*   npm peer dependency uyarıları `--legacy-peer-deps` ile aşıldı.

### [01.12.2025] - Hizmetler Bölümü ve İyileştirmeler

#### Hizmetler (Services) Bölümü Geliştirmeleri
*   **Detaylı Hizmet Listesi:** "Tüm Hizmetleri Görüntüle" butonu eklendi. Modal pencerede kategorize hizmet listesi.
*   **Mobil Uyumluluk:** Hizmet kartlarının mobil cihazlarda düzgün görüntülenmesi için CSS düzenlemeleri.
*   **Görsel Optimizasyonu:** Unsplash görsellerinin çözünürlükleri optimize edildi (`w=600`).
*   **Danışmanlık CTA Alanı:**
    *   Metin iki satıra bölündü.
    *   Modern teknolojik görsel kullanıldı.
    *   Buton tasarımı iyileştirildi.

#### Diğer İyileştirmeler
*   **İngilizce Çeviri Hatası:** `translations.js` dosyasındaki yapısal hata giderildi.
*   **Çeviri Güncellemeleri:** "View All Services" butonu çevirileri tüm dillere eklendi.
*   **Dil Desteği:** README'de dil sayısı güncellendi (5 dil).

## 🚀 Deployment

### Manuel Deployment (FTP)
`deploy.js` dosyasındaki FTP bilgilerini düzenledikten sonra:
```bash
npm run build
node deploy.js
```

### Otomatik Deployment (GitHub Actions)
Her `master` branch'e push işleminde otomatik olarak:
1. Web sitesi derlenir
2. iOS ve Android uygulamaları derlenir
3. Tüm build çıktıları sunucuya yüklenir

Manuel tetikleme için:
```bash
gh workflow run android-build.yml
gh workflow run ios-build.yml
```

## 👤 Geliştirici

**Ahmet ÇAKMAK**
*   Full Stack Geliştirici
*   Yapay Zeka & Makine Öğrenimi Meraklısı
*   [Website](https://ahmetcakmak.com.tr)

---
© 2024 Ahmet ÇAKMAK. Tüm hakları saklıdır.
