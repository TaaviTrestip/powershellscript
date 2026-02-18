# Do While Loop
Write-Host "Do While Loop" -ForegroundColor Cyan

$i = 0
do
{
    Write-Host "Current Value is: " $i -ForegroundColor Cyan
    $i++
}while($i -lt 3)

# Practice 9
Write-Host "Practice 9" -ForegroundColor Red

$count = 0

do {
    if (Get-Process -Name notepad -ErrorAction SilentlyContinue) {
        Write-Host "Notepad is running"
        $count++
        Start-Sleep -Seconds 1
    }
}
while (Get-Process -Name notepad -ErrorAction SilentlyContinue)

Write-Host "Notepad is closed."
Write-Host "The statement was displayed $count times."
