# 🎯 Hızlı Komut Rehberi (Cheat Sheet)

> **Not:** Bu projeyi kullanırken her zaman önce local Docker ortamında çalışın!

---

## ⚡ En Çok Kullanılanlar

### 🏠 **Local'de Çalış**
```powershell
docker-compose up -d
# Kod yaz...
npm run build
docker-compose restart web
# http://localhost:8080'de test et
```

### 🌐 **Sunucuya Gönder**
```powershell
.\sunucuya-gonder.ps1
```
✅ Build eder + FTP ile canlıya yükler

### 🐙 **GitHub'a Gönder**
```powershell
.\github-gonder.ps1
```
✅ Commit + Push (versiyon kontrolü)

---

## 🐳 Docker Komutları

| Komut | Açıklama |
|-------|----------|
| `docker-compose up -d` | Container'ları başlat |
| `docker-compose down` | Container'ları durdur |
| `docker-compose restart web` | Web server'ı yeniden başlat |
| `docker-compose logs -f web` | Web loglarını izle |
| `docker-compose ps` | Container durumlarını gör |
| `docker-compose down -v` | Container'ları + veritabanını sil |

---

## 📦 Build Komutları

| Komut | Açıklama |
|-------|----------|
| `npm run build` | Production build oluştur |
| `npm run dev` | Development server (Vite - PHP çalışmaza) |
| `npm install` | Bağımlılıkları kur |

---

## 🌍 URL'ler

| Servis | Local | Production |
|--------|-------|------------|
| **Portfolio** | http://localhost:8080 | https://ahmetcakmak.com.tr |
| **phpMyAdmin** | http://localhost:8081 | - |
| **GitHub** | - | https://github.com/kullanıcıadı/repo |

---

## 🔑 Veritabanı Bilgileri

### Local (Docker):
- Host: `db` (container içinde) / `localhost:3307` (dışarıdan)
- User: `ahmetcak_admin`
- Pass: `YFatFw9K5WPJnJkVAUeH`
- DB: `ahmetcak_db`

### Production:
- Host: `localhost`  
- User: `ahmetcak_admin`
- Pass: `YFatFw9K5WPJnJkVAUeH`
- DB: `ahmetcak_db`

---

## 📝 Tipik Workflow

### 🆕 Yeni Özellik Eklerken:

```powershell
# 1. Docker'ı başlat
docker-compose up -d

# 2. Kodu yaz

# 3. Test et
npm run build
docker-compose restart web
# http://localhost:8080

# 4. GitHub'a kaydet
.\github-gonder.ps1

# 5. Canlıya al
.\sunucuya-gonder.ps1
```

### 🐛 Hata Düzeltme:

```powershell
# 1. Düzelt

# 2. Test
npm run build && docker-compose restart web

# 3. Direkt canlıya
.\sunucuya-gonder.ps1

# 4. GitHub'a kaydet
.\github-gonder.ps1
```

---

## 🚨 Sorun Giderme

### Docker çalışmıyor:
```powershell
# Docker Desktop'ı başlat
Start-Process "C:\Program Files\Docker\Docker\Docker Desktop.exe"

# 10 saniye bekle, tekrar dene
docker-compose up -d
```

### Port kullanımda:
```yaml
# docker-compose.yml'de portları değiştir
ports:
  - "9090:80"  # web (8080 yerine)
  - "9091:80"  # phpmyadmin (8081 yerine)
```

### Değişiklikler yansımıyor:
```powershell
npm run build
docker-compose down
docker-compose up -d --build
```

### Veritabanı bağlantı hatası:
```powershell
# Logları kontrol et
docker-compose logs db
docker-compose logs web

# Yeniden başlat
docker-compose restart db
```

---

## 📚 Detaylı Dokümantasyon

| Dosya | İçerik |
|-------|--------|
| `WORKFLOW.md` | Tam workflow rehberi |
| `DOCKER_README.md` | Docker detaylı kullanım |
| `README.md` | Genel proje bilgisi |

---

## 💡 Pro İpuçları

1. **Her zaman test et önce!**
   ```powershell
   npm run build && docker-compose restart web
   ```

2. **Logları takip et:**
   ```powershell
   docker-compose logs -f
   ```

3. **Temiz başlangıç:**
   ```powershell
   docker-compose down -v
   docker-compose up -d --build
   ```

4. **Hızlı yeniden başlatma:**
   ```powershell
   docker-compose restart web
   ```

---

**Mutlu Kodlamalar! 🚀**

*Sorularınız için: WORKFLOW.md veya DOCKER_README.md*
