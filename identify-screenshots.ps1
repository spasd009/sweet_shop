Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Identifying Screenshots with 'shubham'" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$screenshotsPath = Join-Path $PSScriptRoot "screenshots"

if (-not (Test-Path $screenshotsPath)) {
    Write-Host "Screenshots folder not found!" -ForegroundColor Red
    exit 1
}

Write-Host "Screenshot files in the folder:" -ForegroundColor Yellow
Write-Host ""

$screenshots = Get-ChildItem -Path $screenshotsPath -Filter "*.png" -File

if ($screenshots.Count -eq 0) {
    Write-Host "No PNG files found in screenshots folder" -ForegroundColor Yellow
    exit 0
}

foreach ($screenshot in $screenshots) {
    Write-Host "  - $($screenshot.Name)" -ForegroundColor White
}

Write-Host ""
Write-Host "Note: Image files cannot be searched for text content." -ForegroundColor Yellow
Write-Host "The following screenshots likely contain 'shubham' as username:" -ForegroundColor Yellow
Write-Host "  - dashboard.png (shows 'Welcome, [username]')" -ForegroundColor White
Write-Host "  - admin.png (shows 'Welcome, [username] (Admin)')" -ForegroundColor White
Write-Host "  - Screenshot files from 2025-12-14" -ForegroundColor White
Write-Host ""
Write-Host "To update these screenshots:" -ForegroundColor Cyan
Write-Host "  1. Run: .\create-test-user.ps1" -ForegroundColor White
Write-Host "  2. Start frontend and login with new user" -ForegroundColor White
Write-Host "  3. Take new screenshots and replace the old ones" -ForegroundColor White
Write-Host ""

