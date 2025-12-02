# 🔄 Development Workflow Guide

Bu proje için geliştirilmiş üç aşamalı workflow sistemi.

---

## 🏠 Local Development (Varsayılan)

### Docker ile Çalışma

Projede çalışırken **her zaman local Docker ortamını** kullanın:

```powershell
# Container'ları başlat (ilk kez veya durdurulduysa)
docker-compose up -d

# Kod değişikliği yaptıktan sonra
npm run build
docker-compose restart web

# Tarayıcıda görüntüle
http://localhost:8080
```

### Geliştirme Döngüsü

1. **Kod yaz** → Favori editörünüzde
2. **Build et** → `npm run build`
3. **Test et** → http://localhost:8080
4. **Tekrarla** → 1'e dön

---

## 🌐 Sunucuya Gönder

Değişiklikleriniz hazır olduğunda **ahmetcakmak.com.tr** sunucusuna deploy edin:

### Komut:

```powershell
powershell -ExecutionPolicy Bypass -File sunucuya-gonder.ps1
```

### Veya kısaca:

```powershell
.\sunucuya-gonder.ps1
```

### Ne Yapar?

1. ✅ Projeyi build eder (`npm run build`)
2. ✅ Build edilen dosyaları FTP ile sunucuya gönderir
3. ✅ İşlem tamamlandığında bildirir
4. ✅ İsteğe bağlı tarayıcıda siteyi açar

**⚠️ Not**: Canlı sunucuya etki eder, dikkatli kullanın!

---

## 🐙 GitHub'a Gönder

Kodunuzu GitHub'a kaydedin:

### Komut:

```powershell
powershell -ExecutionPolicy Bypass -File github-gonder.ps1
```

### Veya kısaca:

```powershell
.\github-gonder.ps1
```

### Ne Yapar?

1. ✅ Değişiklikleri gösterir
2. ✅ Commit mesajı alır (boş bırakılırsa otomatik)
3. ✅ Dosyaları ekler (`git add .`)
4. ✅ Commit yapar
5. ✅ GitHub'a push eder (`git push origin master`)
6. ✅ İsteğe bağlı GitHub repo'yu açar

---

## 📋 Workflow Özeti

### Normal Geliştirme:
```
Local Docker ── Kod Yaz ── Build ── Test ── Tekrar
     ↓
(Her zaman burada çalış)
```

### Production'a Alma:
```
Local Docker ── Test ✅ ── sunucuya-gonder.ps1 ── Canlı Site 🌍
```

### Versiyon Kontrolü:
```
Local Docker ── Önemli Değişiklik ── github-gonder.ps1 ── GitHub 🐙
```

---

## 🎯 Örnek Senaryolar

### Senaryo 1: Yeni Özellik Eklemek

```powershell
# 1. Kodu yaz
# 2. Local'de test et
docker-compose up -d
npm run build
docker-compose restart web
# http://localhost:8080'de kontrol et

# 3. GitHub'a kaydet
.\github-gonder.ps1

# 4. Canlıya al
.\sunucuya-gonder.ps1
```

### Senaryo 2: Hızlı Düzeltme

```powershell
# 1. Düzelt
# 2. Local test
npm run build && docker-compose restart web

# 3. Direkt canlıya al
.\sunucuya-gonder.ps1

# 4. Sonra GitHub'a kaydet
.\github-gonder.ps1
```

### Senaryo 3: Deneysel Özellik

```powershell
# 1. Local'de geliştir ve test et
docker-compose up -d
npm run build
docker-compose restart web

# 2. SADECE GitHub'a kaydet (canlıya alma)
.\github-gonder.ps1

# 3. Hazır olunca canlıya al
.\sunucuya-gonder.ps1
```

---

## 🛠️ Faydalı Komutlar

### Docker Yönetimi

```powershell
# Container'ları başlat
docker-compose up -d

# Container'ları durdur
docker-compose down

# Logları görüntüle
docker-compose logs -f web

# Yeniden başlat
docker-compose restart web

# Tamamen temizle
docker-compose down -v
```

### Manuel Deployment

```powershell
# Build
npm run build

# FTP Deploy
node deploy.js

# Git Push
git add .
git commit -m "Mesaj"
git push origin master
```

---

## 📦 Dosya Yapısı

```
developer-portfolio/
├── src/                    # Kaynak kodlar
├── dist/                   # Build edilmiş dosyalar (sunucuya gider)
├── public/api/             # Backend API'ler
├── docker/                 # Docker yapılandırması
├── docker-compose.yml      # Docker servisleri
├── deploy.js               # FTP deployment scripti
├── sunucuya-gonder.ps1    # 🌐 Production deploy (BU KOMUTU KULLAN)
├── github-gonder.ps1      # 🐙 GitHub push (BU KOMUTU KULLAN)
└── DOCKER_README.md        # Docker detaylı rehber
```

---

## ⚡ Hızlı Referans

| Ne Yapıyorsun? | Komut |
|----------------|-------|
| **Geliştirme** | `docker-compose up -d` → Kod yaz → `npm run build` |
| **Canlıya Al** | `.\sunucuya-gonder.ps1` |
| **GitHub'a Kaydet** | `.\github-gonder.ps1` |
| **Test Et** | http://localhost:8080 |
| **DB Yönet** | http://localhost:8081 (phpMyAdmin) |

---

## 🚨 Önemli Notlar

1. **Her zaman local'de test edin** önce!
2. **`sunucuya-gonder.ps1`** canlı siteyi etkiler
3. **`github-gonder.ps1`** sadece kodu kaydeder, canlıyı etkilemez
4. **Docker container'ları** her geliştirme öncesi başlatın
5. **Build işlemi** mutlaka yapılmalı (`npm run build`)

---

## 💡 İpuçları

- 🔄 Küçük değişiklikler için: test → sunucuya-gonder → github-gonder
- 📦 Büyük özellikler için: test → github-gonder → test → sunucuya-gonder
- 🐛 Hata durumunda: `docker-compose logs -f` ile logları kontrol et
- 🧹 Temiz başlangıç için: `docker-compose down -v && docker-compose up -d --build`

---

**Mutlu Kodlamalar! 🚀**
