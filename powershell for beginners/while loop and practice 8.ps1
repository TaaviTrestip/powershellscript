# While loop
Write-Host "While Loop" -ForegroundColor Cyan

$i = 0
while($i -lt 3)
{
    Write-Host "Current Value is: " $i -ForegroundColor Yellow
    $i++
}

# Practice 8
Write-Host "Practice 8" -ForegroundColor Red

while (Get-Process -Name notepad -ErrorAction SilentlyContinue) {
    Write-Host "Notepad is running"
    Start-Sleep -Seconds 2
}

Write-Host "Notepad is closed."