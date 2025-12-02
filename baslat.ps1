# 🚀 Geliştirme Ortamını Başlat
# Bu scripti her geliştirme başında çalıştırın

Clear-Host

Write-Host ""
Write-Host "╔════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║                                                        ║" -ForegroundColor Cyan
Write-Host "║         🐳 Docker Geliştirme Ortamı Aktif              ║" -ForegroundColor Cyan
Write-Host "║                                                        ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""
Write-Host "  📍 Local: " -NoNewline -ForegroundColor Yellow
Write-Host "http://localhost:8080" -ForegroundColor White
Write-Host "  🗄️  Database: " -NoNewline -ForegroundColor Yellow
Write-Host "http://localhost:8081 (phpMyAdmin)" -ForegroundColor White
Write-Host ""
Write-Host "╭────────────────────────────────────────────────────────╮" -ForegroundColor Green
Write-Host "│  Hazır olduğunuzda:                                    │" -ForegroundColor Green
Write-Host "│                                                        │" -ForegroundColor Green
Write-Host "│  🌐 " -NoNewline -ForegroundColor Green
Write-Host "sunucuya gönder" -NoNewline -ForegroundColor White -BackgroundColor DarkBlue
Write-Host " → ahmetcakmak.com.tr'ye deploy   │" -ForegroundColor Green
Write-Host "│  🐙 " -NoNewline -ForegroundColor Green
Write-Host "github gönder" -NoNewline -ForegroundColor White -BackgroundColor DarkGreen
Write-Host "   → GitHub'a kaydet               │" -ForegroundColor Green
Write-Host "│                                                        │" -ForegroundColor Green
Write-Host "╰────────────────────────────────────────────────────────╯" -ForegroundColor Green
Write-Host ""

# Docker durumunu kontrol et
Write-Host "🔍 Docker durumu kontrol ediliyor..." -ForegroundColor Gray

$dockerRunning = $false
try {
    $result = docker ps 2>&1
    if ($LASTEXITCODE -eq 0) {
        $dockerRunning = $true
    }
}
catch {
    $dockerRunning = $false
}

if (-not $dockerRunning) {
    Write-Host ""
    Write-Host "⚠️  Docker çalışmıyor! Başlatılıyor..." -ForegroundColor Yellow
    Write-Host ""
    
    # Docker Desktop'ı başlat
    Start-Process "C:\Program Files\Docker\Docker\Docker Desktop.exe" -ErrorAction SilentlyContinue
    
    Write-Host "⏳ Docker başlatılıyor, lütfen bekleyin..." -ForegroundColor Yellow
    Start-Sleep -Seconds 10
}

# Container'ları kontrol et ve başlat
Write-Host "🐳 Container'lar kontrol ediliyor..." -ForegroundColor Gray

$containers = docker-compose ps --services --filter "status=running" 2>&1
if ($containers -notcontains "web" -or $containers -notcontains "db") {
    Write-Host ""
    Write-Host "🚀 Container'lar başlatılıyor..." -ForegroundColor Cyan
    docker-compose up -d
    Write-Host ""
    Write-Host "✅ Container'lar hazır!" -ForegroundColor Green
}
else {
    Write-Host "✅ Container'lar zaten çalışıyor" -ForegroundColor Green
}

Write-Host ""
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor DarkGray
Write-Host ""
Write-Host "💡 İpucu: " -NoNewline -ForegroundColor Yellow
Write-Host "Kod değişikliği yaptığınızda:" -ForegroundColor White
Write-Host "   npm run build && docker-compose restart web" -ForegroundColor Gray
Write-Host ""
Write-Host "📚 Yardım: " -NoNewline -ForegroundColor Yellow
Write-Host "CHEATSHEET.md | WORKFLOW.md | DOCKER_README.md" -ForegroundColor White
Write-Host ""
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor DarkGray
Write-Host ""

# Tarayıcıyı aç?
$openBrowser = Read-Host "Tarayıcıda görüntülemek ister misiniz? (Y/N)"
if ($openBrowser -eq 'Y' -or $openBrowser -eq 'y') {
    Start-Process "http://localhost:8080"
}

Write-Host ""
Write-Host "✨ Mutlu kodlamalar! 🚀" -ForegroundColor Magenta
Write-Host ""
