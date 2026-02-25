# Where/Where-Object
Write-Host "Where/Where-Object" -ForegroundColor Cyan

# Get-Service | where{$_.status -eq "Stopped"}

# Get-Service | where{$_.status -eq "Stopped" -and $_.name -like "A*"}

(Get-Service).where({$_.name -like "A*"})

# Practice 5
Write-Host "Practice 5" -ForegroundColor Red

Get-Process | where{$_.ProcessName -eq "notepad"} | Select ProcessName,Id

$file = Get-ChildItem "C:\Temp\Test\*.csv"

Write-Host "FileName : $($file.Name)"
Write-Host "Size in KB : $($file.Length / 1KB)" -ForegroundColor Green
Write-Host "Size in MB : $($file.Length / 1MB)" -ForegroundColor Green