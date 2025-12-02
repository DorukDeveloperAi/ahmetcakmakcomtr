# 🚀 Deployment Script - Sunucuya Gönder
# Bu script projeyi ahmetcakmak.com.tr sunucusuna gönderir

Write-Host "======================================" -ForegroundColor Cyan
Write-Host "  Sunucuya Deploy Başlıyor..." -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan
Write-Host ""

# 1. Build
Write-Host "📦 Proje build ediliyor..." -ForegroundColor Yellow
try {
    & powershell -ExecutionPolicy Bypass -Command "npm run build"
    if ($LASTEXITCODE -ne 0) {
        throw "Build failed"
    }
    Write-Host "✅ Build tamamlandı" -ForegroundColor Green
}
catch {
    Write-Host "❌ Build hatası: $_" -ForegroundColor Red
    exit 1
}

Write-Host ""

# 2. Deploy
Write-Host "🌐 Sunucuya gönderiliyor (ahmetcakmak.com.tr)..." -ForegroundColor Yellow
try {
    & powershell -ExecutionPolicy Bypass -Command "node deploy.js"
    if ($LASTEXITCODE -ne 0) {
        throw "Deploy failed"
    }
    Write-Host "✅ Sunucuya gönderildi" -ForegroundColor Green
}
catch {
    Write-Host "❌ Deploy hatası: $_" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "======================================" -ForegroundColor Cyan
Write-Host "  ✅ Deploy Başarılı!" -ForegroundColor Green
Write-Host "======================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "🌍 Canlı site: https://ahmetcakmak.com.tr" -ForegroundColor White
Write-Host ""

# Tarayıcıda aç
$openBrowser = Read-Host "Siteyi tarayıcıda açmak ister misiniz? (Y/N)"
if ($openBrowser -eq 'Y' -or $openBrowser -eq 'y') {
    Start-Process "https://ahmetcakmak.com.tr"
}
