Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Sweet Shop V2 - Quick Start" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Database: sweetshop_v2" -ForegroundColor Green
Write-Host "Backend Port: 8082" -ForegroundColor Green
Write-Host "Frontend Port: 3000" -ForegroundColor Green
Write-Host ""

# Check MySQL connection
Write-Host "Checking MySQL connection..." -ForegroundColor Yellow
$mysqlRunning = Test-NetConnection -ComputerName localhost -Port 3306 -InformationLevel Quiet -WarningAction SilentlyContinue

if (-not $mysqlRunning) {
    Write-Host "⚠️  MySQL is not running on port 3306!" -ForegroundColor Red
    Write-Host "Please start MySQL before running the application." -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Press any key to continue anyway..." -ForegroundColor Yellow
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
} else {
    Write-Host "✅ MySQL is running" -ForegroundColor Green
}

Write-Host ""
Write-Host "Setting MySQL credentials..." -ForegroundColor Yellow
$env:DB_USERNAME = "root"
$env:DB_PASSWORD = "root"
Write-Host "Using: username=root, password=root" -ForegroundColor Green
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

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Starting Backend Server (Port 8082)..." -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "This may take 30-60 seconds..." -ForegroundColor Yellow
Write-Host ""

# Start backend
mvn spring-boot:run

