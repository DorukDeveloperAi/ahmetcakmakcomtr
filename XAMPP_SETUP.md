# XAMPP Kurulum ve Yapılandırma Rehberi

## 📥 Adım 1: XAMPP Kurulumu

1. **İndir**: https://www.apachefriends.org/download.html
2. Windows için en son sürümü indirin (PHP 8.2 veya üzeri)
3. İndirilen `.exe` dosyasını **yönetici olarak** çalıştırın
4. Kurulum sırasında şunları seçin:
   - ✅ Apache
   - ✅ MySQL
   - ✅ PHP
   - ✅ phpMyAdmin
5. Kurulum konumu: `C:\xampp` (varsayılan - önerilir)

## 🚀 Adım 2: XAMPP Başlatma

1. **XAMPP Control Panel**'i açın: `C:\xampp\xampp-control.exe`
2. **Apache** ve **MySQL** servislerini başlatın (Start butonları)
3. Portlar:
   - Apache: 80 (veya 8080)
   - MySQL: 3306

### Port Çakışması Varsa:
Eğer port 80 kullanımdaysa (Skype, IIS gibi):
1. XAMPP Control Panel'de Apache'nin yanındaki **Config** > **httpd.conf**
2. `Listen 80` satırını bulun ve `Listen 8080` yapın
3. `ServerName localhost:80` satırını `ServerName localhost:8080` yapın
4. Kaydet ve Apache'yi yeniden başlat

## 🗄️ Adım 3: MySQL Veritabanı Kurulumu

1. Tarayıcıda açın: `http://localhost/phpmyadmin`
2. Sol menüden **Yeni** (New) tıklayın
3. Veritabanı adı: `ahmetcak_db`
4. Karakter seti: `utf8mb4_unicode_ci`
5. **Oluştur** (Create) butonuna tıklayın

### Kullanıcı Oluşturma:
1. **Kullanıcı hesapları** sekmesine gidin
2. **Kullanıcı hesabı ekle**:
   - Kullanıcı adı: `ahmetcak_admin`
   - Ana makine: `localhost`
   - Parola: `YFatFw9K5WPJnJkVAUeH`
   - Veritabanı için tüm ayrıcalıklar: ✅ İşaretle
   - **Git** butonuna tıklayın

## 📁 Adım 4: Proje Dosyalarını Kopyalama

Projenizi XAMPP'in htdocs klasörüne kopyalayın:

### Seçenek 1: Manuel Kopyalama
```
Kaynak: d:\silinmeyecek\kisisel\developer-portfolio\dist\*
Hedef: C:\xampp\htdocs\portfolio\
```

### Seçenek 2: Otomatik (PowerShell komutu çalıştırın)
```powershell
# dist klasörünü htdocs'a kopyala
Copy-Item -Path "d:\silinmeyecek\kisisel\developer-portfolio\dist\*" -Destination "C:\xampp\htdocs\portfolio\" -Recurse -Force
```

## 🔧 Adım 5: Veritabanı Tablolarını Oluşturma

Tarayıcıda şu URL'leri sırayla açın:

1. **Chat logs tablosu**: `http://localhost/portfolio/api/setup_chat_db.php`
2. **Blog ve Testimonials tabloları**: `http://localhost/portfolio/api/install.php`

Başarılı mesajları görmelisiniz.

## ✅ Adım 6: Projeyi Test Etme

Tarayıcıda açın: `http://localhost/portfolio/`

### Test Edilecekler:
- ✅ Sayfa yükleniyor mu?
- ✅ Dil değiştirme çalışıyor mu?
- ✅ AI Chat widget açılıyor mu?
- ✅ Chat mesajları veritabanına kaydediliyor mu?
- ✅ Blog ve Testimonials yükleniyor mu?

## 🔍 Hata Ayıklama

### Veritabanı Bağlantı Hatası:
1. `public/api/db.php` dosyasını kontrol edin
2. MySQL servisinin çalıştığından emin olun (XAMPP Control Panel)

### 404 Hatası:
1. Dosyaların doğru yere kopyalandığından emin olun
2. Apache servisinin çalıştığından emin olun

### Chat Kayıt Edilmiyor:
1. phpMyAdmin'de `chat_logs` tablosunun oluştuğunu kontrol edin
2. Tarayıcı Console'da (F12) hata mesajlarını kontrol edin

## 📝 Notlar

- **Production ve Development farklılıkları**:
  - Production: `ahmetcakmak.com.tr`
  - Local: `localhost/portfolio/`
  
- **API çağrıları** otomatik olarak doğru URL'yi kullanır (`/api/...`)

- **Geliştirme modu** için `npm run dev` de kullanabilirsiniz ama PHP backend için XAMPP gereklidir

## 🎯 Sonraki Adımlar

XAMPP kurulumu tamamlandıktan sonra aşağıdaki komutu çalıştırın:

```powershell
powershell -ExecutionPolicy Bypass -File setup-xampp.ps1
```

Bu script otomatik olarak:
- Dosyaları kopyalayacak
- Veritabanını kuracak
- Tarayıcıyı açacak
