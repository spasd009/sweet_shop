Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Starting Sweet Shop V2 with H2 Database" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Using H2 in-memory database (no MySQL needed!)" -ForegroundColor Green
Write-Host ""

# Check if port 8082 is in use
Write-Host "Checking if port 8082 is available..." -ForegroundColor Yellow
$portCheck = netstat -ano | findstr :8082
if ($portCheck) {
    Write-Host "⚠️  Port 8082 is already in use!" -ForegroundColor Yellow
    Write-Host "Stopping existing process..." -ForegroundColor Yellow
    $portCheck | ForEach-Object {
        if ($_ -match '\s+(\d+)\s*$') {
            $pid = $matches[1]
            Stop-Process -Id $pid -Force -ErrorAction SilentlyContinue
        }
    }
    Start-Sleep -Seconds 2
}

Write-Host "Starting Spring Boot with H2 database..." -ForegroundColor Green
Write-Host "This will take about 30-60 seconds..." -ForegroundColor Yellow
Write-Host ""

# Use H2 profile (no MySQL needed)
.\mvnw.cmd spring-boot:run -Dspring-boot.run.profiles=h2

