# 🐳 Docker ile Local Development

Bu rehber, projeyi Docker kullanarak local ortamda çalıştırmanız için gerekli adımları içerir.

## 📋 Ön Gereksinimler

- ✅ Docker Desktop kurulu olmalı
- ✅ Docker çalışır durumda olmalı

## 🚀 Hızlı Başlangıç

### 1. Docker Container'ları Başlat

```powershell
docker-compose up -d --build
```

Bu komut:
- PHP 8.2 + Apache web server
- MySQL 8.0 database
- phpMyAdmin
servislerini başlatır.

### 2. Container Durumunu Kontrol Et

```powershell
docker-compose ps
```

Üç servis de çalışıyor olmalı:
- ✅ portfolio-web (PHP/Apache)
- ✅ portfolio-db (MySQL)
- ✅ portfolio-phpmyadmin

### 3. Projeye Eriş

Tarayıcınızda şu adresleri açın:

- **Portfolio**: http://localhost:8080
- **phpMyAdmin**: http://localhost:8081
  - Kullanıcı: `ahmetcak_admin`
  - Şifre: `YFatFw9K5WPJnJkVAUeH`

## 🗄️ Veritabanı

Veritabanı otomatik olarak oluşturulur ve aşağıdaki tablolar hazır gelir:
- ✅ `chat_logs` - AI chat kayıtları
- ✅ `testimonials` - Referanslar
- ✅ `blogs` - Blog yazıları

Örnek veriler de otomatik olarak eklenir.

## 🔄 Değişiklikleri Görmek

### Kod Değişiklikleri

1. Kodu değiştirin
2. Build edin:
```powershell
npm run build
```

3. Değişiklikler otomatik yansır (volume mount sayesinde)

### Tarayıcıyı yenileyin: `Ctrl + F5`

## 📝 Faydalı Komutlar

### Container'ları Durdur
```powershell
docker-compose down
```

### Container'ları Durdur ve Veritabanını Sil
```powershell
docker-compose down -v
```

### Logları Görüntüle
```powershell
# Tüm servisler
docker-compose logs -f

# Sadece web servisi
docker-compose logs -f web

# Sadece database
docker-compose logs -f db
```

### Container'a Bağlan (SSH)
```powershell
# Web container'a
docker exec -it portfolio-web bash

# Database container'a
docker exec -it portfolio-db bash
```

### Veritabanını Yeniden Başlat
```powershell
docker-compose restart db
```

## 🔧 Portlar

- **8080**: Web server (Apache + PHP)
- **8081**: phpMyAdmin
- **3307**: MySQL (host'tan erişim için)

## 🐛 Sorun Giderme

### Port zaten kullanılıyor
`docker-compose.yml` dosyasındaki portları değiştirin:
```yaml
ports:
  - "9090:80"  # 8080 yerine
```

### Container başlamıyor
```powershell
# Logları kontrol edin
docker-compose logs web

# Container'ı yeniden build edin
docker-compose up -d --build --force-recreate
```

### Veritabanı bağlantı hatası
1. MySQL container'ın çalıştığından emin olun:
```powershell
docker-compose ps
```

2. Veritabanı loglarını kontrol edin:
```powershell
docker-compose logs db
```

### Değişiklikler yansımıyor
1. Build edin:
```powershell
npm run build
```

2. Container'ı yeniden başlatın:
```powershell
docker-compose restart web
```

## 🎯 Test Listesi

Proje çalıştıktan sonra test edin:

- [ ] Ana sayfa açılıyor: http://localhost:8080
- [ ] Dil değiştirme çalışıyor
- [ ] AI Chat widget açılıyor
- [ ] Chat mesajları gönderiliyor
- [ ] phpMyAdmin açılıyor: http://localhost:8081
- [ ] Blog ve Testimonials yükleniyor
- [ ] Chat logları veritabanına kaydediliyor

## 🛑 Tamamen Temizlik

Her şeyi sıfırdan başlatmak için:

```powershell
# Container'ları durdur ve sil
docker-compose down -v

# Image'ları sil
docker rmi portfolio-web

# Yeniden başlat
docker-compose up -d --build
```

## 📚 Ek Bilgiler

### Veritabanı Bilgileri
- Host: `db` (container içinden) / `localhost:3307` (host'tan)
- Database: `ahmetcak_db`
- User: `ahmetcak_admin`
- Password: `YFatFw9K5WPJnJkVAUeH`

### Volume'ler
- `mysql-data`: MySQL verilerini kalıcı tutar
- `./dist`: Web dosyalarını container'a mount eder

### Network
- `portfolio-network`: Container'lar arası iletişim

Herhangi bir sorun yaşarsanız `docker-compose logs` komutuyla logları kontrol edin! 🚀
