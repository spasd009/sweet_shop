Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Create Test User for Screenshots" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Configuration
$backendUrl = "http://localhost:8082"
$username = "admin"
$password = "admin123"
$role = "ADMIN"

Write-Host "Creating test user..." -ForegroundColor Yellow
Write-Host "Username: $username" -ForegroundColor White
Write-Host "Password: $password" -ForegroundColor White
Write-Host "Role: $role" -ForegroundColor White
Write-Host ""

# Test if backend is running
try {
    $pingResponse = Invoke-WebRequest -Uri "$backendUrl/api/auth/ping" -UseBasicParsing -TimeoutSec 5
    Write-Host "✅ Backend is running" -ForegroundColor Green
} catch {
    Write-Host "❌ Backend is not running on $backendUrl" -ForegroundColor Red
    Write-Host "Please start the backend first:" -ForegroundColor Yellow
    Write-Host "  cd sweet-shop-v2" -ForegroundColor White
    Write-Host "  mvn spring-boot:run" -ForegroundColor White
    exit 1
}

Write-Host ""
Write-Host "Registering user..." -ForegroundColor Yellow

$registerBody = @{
    username = $username
    password = $password
    role = $role
} | ConvertTo-Json

try {
    $response = Invoke-WebRequest -Uri "$backendUrl/api/auth/register" -Method POST -Body $registerBody -ContentType "application/json" -UseBasicParsing -TimeoutSec 5
    
    if ($response.StatusCode -eq 200 -or $response.StatusCode -eq 201) {
        Write-Host "✅ User created successfully!" -ForegroundColor Green
        Write-Host ""
        Write-Host "Login credentials:" -ForegroundColor Cyan
        Write-Host "  Username: $username" -ForegroundColor White
        Write-Host "  Password: $password" -ForegroundColor White
        Write-Host ""
        Write-Host "You can now:" -ForegroundColor Yellow
        Write-Host "  1. Open http://localhost:3000" -ForegroundColor White
        Write-Host "  2. Login with the credentials above" -ForegroundColor White
        Write-Host "  3. Take new screenshots" -ForegroundColor White
    }
} catch {
    if ($_.Exception.Response.StatusCode -eq 400) {
        $reader = New-Object System.IO.StreamReader($_.Exception.Response.GetResponseStream())
        $responseBody = $reader.ReadToEnd()
        
        if ($responseBody -like "*already exists*" -or $responseBody -like "*duplicate*") {
            Write-Host "⚠️  User already exists. Trying to login..." -ForegroundColor Yellow
            
            # Try to login instead
            $loginBody = @{
                username = $username
                password = $password
            } | ConvertTo-Json
            
            try {
                $loginResponse = Invoke-WebRequest -Uri "$backendUrl/api/auth/login" -Method POST -Body $loginBody -ContentType "application/json" -UseBasicParsing -TimeoutSec 5
                Write-Host "✅ Login successful! User exists and credentials work." -ForegroundColor Green
                Write-Host ""
                Write-Host "Login credentials:" -ForegroundColor Cyan
                Write-Host "  Username: $username" -ForegroundColor White
                Write-Host "  Password: $password" -ForegroundColor White
            } catch {
                Write-Host "❌ Login failed. User may exist with different password." -ForegroundColor Red
                Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
            }
        } else {
            Write-Host "❌ Registration failed" -ForegroundColor Red
            Write-Host "Error: $responseBody" -ForegroundColor Red
        }
    } else {
        Write-Host "❌ Registration failed" -ForegroundColor Red
        Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan

