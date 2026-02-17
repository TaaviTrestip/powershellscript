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

# $result

$result = @()
$services = Get-Content "C:\Users\Taavi\powershellscript\powershell for beginners\Services.txt"

$services | ForEach-Object {

    Write-Host "Checking status of service: $_"

    $data = Get-Service $_ | Select-Object Name, Status

    $result += $data
}

# $result

# Practice 6
Write-Host "Practice 6" -ForegroundColor Red
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

$result | Export-Csv "C:\Users\Taavi\powershellscript\powershell for beginners\schoolresults.csv" -NoTypeInformation

# For Loop
Write-Host "For Loop" -ForegroundColor Cyan
for($i = 1 ; $i -le 10 ; $i++)
{
Write-Host "Current value : "$i -ForegroundColor Green
}

$groups = "Red","Green","Yellow","Blue"

$result = foreach ($roll in 1..20) {

    [PSCustomObject]@{
        RollNumber = $roll
        Group      = Get-Random -InputObject $groups
    }
}

$result
