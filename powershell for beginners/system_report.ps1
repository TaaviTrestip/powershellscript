# Final Practice 14
$reportFile = "C:\Temp\report.txt"

# Empty old report file
"" | Out-File $reportFile

$name = Read-Host "Enter your name: "
"Enter your name: $name" | Out-File $reportFile -Append
$repetitions = Read-Host "How many times to greet? "
"How many times to greet? $repetitions" | Out-File $reportFile -Append

for($i = 1; $i -le $repetitions; $i++)
{
$greeting = "Hello, $name! ($i)"
Write-Host $greeting -ForegroundColor Green
$greeting | Out-File $reportFile -Append
}

# System info
Write-Host "Quick System Info" -ForegroundColor Cyan
"Quick System Info" | Out-File $reportFile -Append
$computerName = $env:COMPUTERNAME
$username = $env:USERNAME
$psVersion = $PSVersionTable.PSVersion

Write-Host "Computer name: $computerName"
Write-Host "User: $username"
Write-Host "PowerShell version: $psVersion"

"Computer name: $computerName" | Out-File $reportFile -Append
"User: $username" | Out-File $reportFile -Append
"PowerShell version: $psVersion" | Out-File $reportFile -Append

# CMDLET
#Processes
Write-Host "3 Working Processes" -ForegroundColor Cyan
"3 Working Processes" | Out-File $reportFile -Append
$processes = Get-Process | Select-Object -First 3 Name, Id
$processes | Format-Table
$processes | Format-Table | Out-String | Out-File $reportFile -Append
#Services
Write-Host "3 Working Services" -ForegroundColor Cyan
"3 Working Services" | Out-File $reportFile -Append
$services = Get-Service | Select-Object -First 3 Name, Status
$services | Format-Table
$services | Format-Table | Out-String | Out-File $reportFile -Append

# PowerShell Version Check
Write-Host "PowerShell version check" -ForegroundColor Cyan
"PowerShell version check" | Out-File $reportFile -Append

if ($PSVersionTable.PSVersion.Major -lt 5) {
$message = "WARNING: PowerShell version below 5!"
}
else {
$message = "PowerShell version good!"
}
Write-Host $message
$message | Out-File $reportFile -Append

# Date and Time of Report
$datetime = Get-Date
Write-Host "Date and Time of Report: $datetime"
"Date and Time of Report: $datetime" | Out-File $reportFile -Append

Write-Host ""
Write-Host "==========================="
Write-Host "Script finished successfully"
Write-Host "==========================="