# run-detached.ps1
# Build the project and run the generated jar as a background job, logging to sweetshop.log

Set-Location $PSScriptRoot

Write-Host "Building project (skip tests)..."
& .\mvnw.cmd -DskipTests package

$jar = Get-ChildItem target -Filter '*.jar' | Sort-Object LastWriteTime -Descending | Select-Object -First 1
if (-not $jar) {
    Write-Error "Jar not found in target/. Build failed?"
    exit 1
}

$log = Join-Path $PSScriptRoot 'sweetshop.log'
Write-Host "Starting jar: $($jar.FullName) -> logging to $log"

# Start as a background job and redirect stdout/stderr to the log
Start-Job -Name sweetshop -ArgumentList $jar.FullName,$log -ScriptBlock {
    param($j,$l)
    # Use shell redirection to capture both stdout and stderr
    & java -jar $j --server.port=8082 *> $l
} | Out-Null

Start-Sleep -Seconds 2
Write-Host "Waiting for server to respond on http://localhost:8082/api/auth/ping ..."
$max=30; $i=0
while ($i -lt $max) {
    try {
        $r = Invoke-WebRequest -UseBasicParsing -Uri 'http://localhost:8082/api/auth/ping' -TimeoutSec 2
        if ($r.StatusCode -eq 200) { Write-Host "Application started and healthy."; break }
    } catch {}
    Start-Sleep -Seconds 1
    $i++
}
if ($i -ge $max) { Write-Host "Timed out waiting for health endpoint; check .\sweetshop.log for details." }

Write-Host "Commands:"
Write-Host "  View logs: Get-Content .\sweetshop.log -Tail 200 -Wait"
Write-Host "  View job: Get-Job -Name sweetshop"
Write-Host "  Stop job: Stop-Job -Name sweetshop; Remove-Job -Name sweetshop"
Write-Host "  Or stop by PID: netstat -ano | findstr :8082  then taskkill /PID <PID> /F"
