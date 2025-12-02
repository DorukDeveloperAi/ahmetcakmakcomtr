# XAMPP Otomatik Kurulum Scripti
# Bu script projeyi XAMPP'e kurar

Write-Host "===================================" -ForegroundColor Cyan
Write-Host " XAMPP Kurulum Scripti" -ForegroundColor Cyan
Write-Host "===================================" -ForegroundColor Cyan
Write-Host ""

# XAMPP varlık kontrolü
if (-not (Test-Path "C:\xampp")) {
    Write-Host "HATA: XAMPP bulunamadı!" -ForegroundColor Red
    Write-Host "Lütfen önce XAMPP'i kurun: https://www.apachefriends.org" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Kurulum adımları için XAMPP_SETUP.md dosyasını okuyun." -ForegroundColor Yellow
    exit 1
}

Write-Host "✓ XAMPP bulundu: C:\xampp" -ForegroundColor Green
Write-Host ""

# Apache ve MySQL kontrol
Write-Host "XAMPP Control Panel'de Apache ve MySQL servislerinin" -ForegroundColor Yellow
Write-Host "çalıştığından emin olun!" -ForegroundColor Yellow
Write-Host ""
$continue = Read-Host "Devam etmek için 'Y' tuşlayın, iptal için 'N'"
if ($continue -ne 'Y' -and $continue -ne 'y') {
    Write-Host "İptal edildi." -ForegroundColor Yellow
    exit 0
}

# Hedef klasörü oluştur
$htdocsPath = "C:\xampp\htdocs\portfolio"
if (Test-Path $htdocsPath) {
    Write-Host "Portfolio klasörü zaten mevcut, siliniyor..." -ForegroundColor Yellow
    Remove-Item -Path $htdocsPath -Recurse -Force
}

Write-Host "Portfolio klasörü oluşturuluyor..." -ForegroundColor Cyan
New-Item -Path $htdocsPath -ItemType Directory -Force | Out-Null

# dist klasörünü kopyala
Write-Host "Dosyalar kopyalanıyor..." -ForegroundColor Cyan
$sourcePath = "d:\silinmeyecek\kisisel\developer-portfolio\dist\*"
Copy-Item -Path $sourcePath -Destination $htdocsPath -Recurse -Force

Write-Host "✓ Dosyalar kopyalandı" -ForegroundColor Green
Write-Host ""

# Veritabanı kurulumu için talimatlar
Write-Host "===================================" -ForegroundColor Cyan
Write-Host " Veritabanı Kurulumu" -ForegroundColor Cyan
Write-Host "===================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Şimdi veritabanını kurmanız gerekiyor:" -ForegroundColor Yellow
Write-Host ""
Write-Host "1. phpMyAdmin'i açın: http://localhost/phpmyadmin" -ForegroundColor White
Write-Host ""
Write-Host "2. Yeni veritabanı oluşturun:" -ForegroundColor White
Write-Host "   - İsim: ahmetcak_db" -ForegroundColor Gray
Write-Host "   - Karakter seti: utf8mb4_unicode_ci" -ForegroundColor Gray
Write-Host ""
Write-Host "3. Kullanıcı oluşturun:" -ForegroundColor White
Write-Host "   - Kullanıcı adı: ahmetcak_admin" -ForegroundColor Gray
Write-Host "   - Parola: YFatFw9K5WPJnJkVAUeH" -ForegroundColor Gray
Write-Host "   - Ana makine: localhost" -ForegroundColor Gray
Write-Host "   - Tüm ayrıcalıklar: İşaretle" -ForegroundColor Gray
Write-Host ""
Write-Host "4. Tabloları oluşturun (tarayıcıda açın):" -ForegroundColor White
Write-Host "   - http://localhost/portfolio/api/setup_chat_db.php" -ForegroundColor Gray
Write-Host "   - http://localhost/portfolio/api/install.php" -ForegroundColor Gray
Write-Host ""

$openBrowser = Read-Host "Tarayıcıyı otomatik açmak ister misiniz? (Y/N)"
if ($openBrowser -eq 'Y' -or $openBrowser -eq 'y') {
    Write-Host ""
    Write-Host "Tarayıcı açılıyor..." -ForegroundColor Cyan
    
    # phpMyAdmin
    Start-Process "http://localhost/phpmyadmin"
    Start-Sleep -Seconds 2
    
    # Portfolio
    Start-Process "http://localhost/portfolio/"
    
    Write-Host "✓ Tarayıcı açıldı" -ForegroundColor Green
}

Write-Host ""
Write-Host "===================================" -ForegroundColor Cyan
Write-Host " Kurulum Tamamlandı!" -ForegroundColor Green
Write-Host "===================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Projenize şuradan erişebilirsiniz:" -ForegroundColor White
Write-Host "http://localhost/portfolio/" -ForegroundColor Cyan
Write-Host ""
Write-Host "Veritabanı kurulumunu tamamlamayı unutmayın!" -ForegroundColor Yellow
Write-Host ""
