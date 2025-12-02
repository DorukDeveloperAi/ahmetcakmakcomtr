# 🐙 GitHub Push Script
# Bu script değişiklikleri GitHub'a gönderir

Write-Host "======================================" -ForegroundColor Cyan
Write-Host "  GitHub'a Gönderiliyor..." -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan
Write-Host ""

# Değişiklikleri göster
Write-Host "📝 Değişiklikler:" -ForegroundColor Yellow
git status --short

Write-Host ""

# Commit mesajı al
$commitMessage = Read-Host "Commit mesajı girin (boş bırakırsanız otomatik mesaj kullanılır)"

if ([string]::IsNullOrWhiteSpace($commitMessage)) {
    $commitMessage = "Update: $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
    Write-Host "📝 Otomatik mesaj kullanılıyor: $commitMessage" -ForegroundColor Gray
}

Write-Host ""

# Git işlemleri
try {
    # Tüm değişiklikleri ekle
    Write-Host "➕ Dosyalar ekleniyor..." -ForegroundColor Yellow
    git add .
    
    # Commit
    Write-Host "💾 Commit yapılıyor..." -ForegroundColor Yellow
    git commit -m "$commitMessage"
    
    # Push
    Write-Host "🚀 GitHub'a gönderiliyor..." -ForegroundColor Yellow
    git push origin master
    
    Write-Host ""
    Write-Host "======================================" -ForegroundColor Cyan
    Write-Host "  ✅ GitHub'a Gönderildi!" -ForegroundColor Green
    Write-Host "======================================" -ForegroundColor Cyan
    
}
catch {
    Write-Host ""
    Write-Host "❌ Hata: $_" -ForegroundColor Red
    Write-Host ""
    
    # Eğer commit edilecek bir şey yoksa bilgi ver
    if ($_ -like "*nothing to commit*") {
        Write-Host "ℹ️  Commit edilecek değişiklik yok." -ForegroundColor Yellow
    }
}

Write-Host ""

# GitHub repo linkini göster
$remoteUrl = git config --get remote.origin.url
if ($remoteUrl) {
    Write-Host "🔗 GitHub Repo: $remoteUrl" -ForegroundColor White
    
    $openGitHub = Read-Host "GitHub repo'yu tarayıcıda açmak ister misiniz? (Y/N)"
    if ($openGitHub -eq 'Y' -or $openGitHub -eq 'y') {
        # URL'i düzenle (git@ veya https olabilir)
        $webUrl = $remoteUrl -replace 'git@github.com:', 'https://github.com/' -replace '\.git$', ''
        Start-Process $webUrl
    }
}
