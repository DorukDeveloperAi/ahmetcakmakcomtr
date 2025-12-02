# Developer Portfolio - Workspace Hatırlatıcı

## ⚠️ ÖNEMLİ HATIRLATMA

```
╔════════════════════════════════════════════════════════╗
║                                                        ║
║      🐳 Docker Ortamında Çalışıyorsunuz               ║
║                                                        ║
╚════════════════════════════════════════════════════════╝

📍 Local: http://localhost:8080
🗄️ Database: http://localhost:8081

╭────────────────────────────────────────────────────────╮
│  Hazır olduğunuzda:                                    │
│                                                        │
│  🌐 "sunucuya gönder" → ahmetcakmak.com.tr'ye deploy  │
│  🐙 "github gönder"   → GitHub'a kaydet                │
│                                                        │
╰────────────────────────────────────────────────────────╯
```

---

## 🚀 Hızlı Başlangıç

Her geliştirme oturumunda:

```powershell
.\baslat.ps1
```

Bu script:
- ✅ Docker'ı başlatır
- ✅ Container'ları hazırlar
- ✅ Hatırlatıcı mesajı gösterir
- ✅ Tarayıcıyı açar (isteğe bağlı)

---

## 📝 Komutlar

### Production'a Deploy:
```powershell
.\sunucuya-gonder.ps1
```

### GitHub'a Push:
```powershell
.\github-gonder.ps1
```

### Geliştirme Döngüsü:
```powershell
# Kod yaz...
npm run build
docker-compose restart web
# Test et: http://localhost:8080
```

---

Bu dosyayı her açtığınızda hatırlatıcıyı göreceksiniz! 🎯
