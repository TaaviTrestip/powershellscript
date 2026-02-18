# Do Until Loop
Write-Host "Do Until Loop" -ForegroundColor Cyan
$i = 0
do
{
    Write-Host "Current Value is: " $i -ForegroundColor Yellow
    $i++
}until($i -ge 3)

# Practice 10
Write-Host "Practice 10" -ForegroundColor Red

$count = 0

do {
    Write-Host "Notepad is running"
    $count++
    Start-Sleep -Seconds 1
}
until ((Get-Process -Name notepad -ErrorAction SilentlyContinue).Count -eq 0)

Write-Host "Notepad is closed."
Write-Host "The statement was displayed $count times."