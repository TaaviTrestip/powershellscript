# Loops
Write-Host "Loops" -ForegroundColor Cyan
# ForEach() Loop
Write-Host "ForEach()" -ForegroundColor Cyan
$result = @()
$services = Get-Content "C:\Users\Taavi\powershellscript\powershell for beginners\Services.txt"

foreach($s in $services)
{
$data = $null
$data = Get-Service $s | Select Name,Status
$result += $data
}

$result

$result = @()
$services = Get-Content "C:\Users\Taavi\powershellscript\powershell for beginners\Services.txt"

$services | ForEach-Object {

    Write-Host "Checking status of service: $_"

    $data = Get-Service $_ | Select-Object Name, Status

    $result += $data
}

$result

# Practice 6
Write-Host "Practice 6" -ForegroundColor Cyan
$students = Import-Csv "C:\Users\Taavi\powershellscript\powershell for beginners\ages.csv" -Header Name,Age

$result = foreach ($student in $students) {

    if ([int]$student.Age -ge 4 -and [int]$student.Age -le 10) {
        $school = "Junior"
    }
    elseif ([int]$student.Age -ge 11 -and [int]$student.Age -le 17) {
        $school = "Senior"
    }

    [PSCustomObject]@{
        Name   = $student.Name
        School = $school
    }
}

$result

$result | Export-Csv "C:\Users\Taavi\powershellscript\powershell for beginners\schoolresults.csv" -NoTypeInformation