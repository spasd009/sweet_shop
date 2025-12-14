Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Sweet Shop - Setup and Run Script" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if MySQL is running
Write-Host "Checking MySQL connection..." -ForegroundColor Yellow
$mysqlRunning = Test-NetConnection -ComputerName localhost -Port 3306 -InformationLevel Quiet -WarningAction SilentlyContinue

if (-not $mysqlRunning) {
    Write-Host ""
    Write-Host "⚠️  MySQL is not running on port 3306!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please install and start MySQL:" -ForegroundColor Yellow
    Write-Host "1. Download MySQL from: https://dev.mysql.com/downloads/installer/" -ForegroundColor White
    Write-Host "2. Install MySQL and remember your root password" -ForegroundColor White
    Write-Host "3. Start MySQL service:" -ForegroundColor White
    Write-Host "   - Open Services (Win+R, type 'services.msc')" -ForegroundColor White
    Write-Host "   - Find 'MySQL80' or 'MySQL' service" -ForegroundColor White
    Write-Host "   - Right-click and select 'Start'" -ForegroundColor White
    Write-Host ""
    Write-Host "Or use Docker (if installed):" -ForegroundColor Yellow
    Write-Host "   docker-compose up -d mysql" -ForegroundColor White
    Write-Host ""
    Write-Host "Press any key to continue anyway (application may fail to connect)..." -ForegroundColor Yellow
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
} else {
    Write-Host "✅ MySQL is running on port 3306" -ForegroundColor Green
}

Write-Host ""
Write-Host "Setting MySQL credentials..." -ForegroundColor Yellow
$env:DB_USERNAME = "root"
$env:DB_PASSWORD = "root"
Write-Host "Using: username=root, password=root" -ForegroundColor Green
Write-Host "Note: If your MySQL password is different, update application-mysql.properties" -ForegroundColor Yellow
Write-Host ""

# Check if port 8081 is in use
Write-Host "Checking if port 8081 is available..." -ForegroundColor Yellow
$portCheck = netstat -ano | findstr :8081
if ($portCheck) {
    Write-Host "⚠️  Port 8081 is already in use!" -ForegroundColor Yellow
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
Write-Host "Starting Backend Server..." -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Backend will start on: http://localhost:8081" -ForegroundColor Green
Write-Host "This may take 30-60 seconds..." -ForegroundColor Yellow
Write-Host ""

# Start backend in background
$backendJob = Start-Job -ScriptBlock {
    Set-Location $using:PWD
    $env:DB_USERNAME = "root"
    $env:DB_PASSWORD = "root"
    mvn spring-boot:run
}

Write-Host "Backend is starting in the background..." -ForegroundColor Green
Write-Host "Waiting for backend to be ready..." -ForegroundColor Yellow

# Wait for backend to start (check if port 8081 is listening)
$maxWait = 120
$waited = 0
$backendReady = $false

while ($waited -lt $maxWait -and -not $backendReady) {
    Start-Sleep -Seconds 2
    $waited += 2
    $portListening = Test-NetConnection -ComputerName localhost -Port 8081 -InformationLevel Quiet -WarningAction SilentlyContinue
    if ($portListening) {
        $backendReady = $true
        Write-Host "✅ Backend is ready!" -ForegroundColor Green
        break
    }
    Write-Host "." -NoNewline -ForegroundColor Gray
}

Write-Host ""
if (-not $backendReady) {
    Write-Host "⚠️  Backend may still be starting. Check the logs above for errors." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Starting Frontend Server..." -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Set-Location frontend

# Check if node_modules exists
if (-not (Test-Path "node_modules")) {
    Write-Host "Installing frontend dependencies..." -ForegroundColor Yellow
    npm install
}

Write-Host "Starting frontend development server..." -ForegroundColor Green
Write-Host "Frontend will start on: http://localhost:5173" -ForegroundColor Green
Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Application URLs:" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Frontend: http://localhost:5173" -ForegroundColor Green
Write-Host "Backend API: http://localhost:8081/api" -ForegroundColor Green
Write-Host ""
Write-Host "Press Ctrl+C to stop all servers" -ForegroundColor Yellow
Write-Host ""

# Start frontend (this will block)
npm run dev


