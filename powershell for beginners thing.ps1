Write-Host "I want to learn Powershell" -ForegroundColor Green

# Variable
Write-Host "Variable" -ForegroundColor Cyan
10+4
10-4
10*4

$a = 10
$b = 4
$a+$b
$a-$b
$a*$b

# Data Types
Write-Host "Data Types" -ForegroundColor Cyan
$v = 1 + 1
$v
$v.GetType()

$v = '1' + '1'
$v
$v.GetType()

$v = 1.9
[int32]$v
[float]$v
[string]$v
[boolean]$v
[datetime]$v

# Arrays
Write-Host "Arrays" -ForegroundColor Cyan
$nameArray = @("John Pork","Joe Mama","crocodilobombardino")
$nameArray[0]
$nameArray[1]
$nameArray[2]
Write-Host "Practice 1" -ForegroundColor Red
# Practice 1
$array1 = @(1, 2, 3)
$array2 = @(4, 5, 6)

$array3 = @()

$array3 += $array1[0] + $array2[0]
$array3 += $array1[1] + $array2[1]
$array3 += $array1[2] + $array2[2]

$array3

# Hashtable
Write-Host "Hashtables" -ForegroundColor Cyan
Write-Host "First Hashtable" -ForegroundColor Cyan
$user=@{FirstName="John"; LastName="Smith"; MiddleInitial="J"; Age=40}
$user.FirstName
$user.LastName
$user.MiddleInitial
$user.Age

Write-Host "Second Hashtable" -ForegroundColor Cyan
$user=@{FirstName="John","Joe","Garry"; LastName="Smith","Parker","Smith"; MiddleInitial="D","L","N"; Age=40,32,25}
$user
$user.Age
$user.FirstName
$user.Lastname

Write-Host "Practice 2" -ForegroundColor Red
$daysworked = @{Name="John","Joe","Mary";DaysWorked=12,20,18}
$salary = @{Name="John","Joe","Mary";SalaryPerDay=100,120,150}
$johnsalary = $daysworked.DaysWorked[0] * $salary.SalaryPerDay[0]
$joesalary = $daysworked.DaysWorked[1] * $salary.SalaryPerDay[1]
$marysalary = $daysworked.DaysWorked[2] * $salary.SalaryPerDay[2]
$finalsalary = @{Name=$daysworked.Name[0],$daysworked.Name[1],$daysworked.Name[2];Salary=$johnsalary,$joesalary,$marysalary}
$finalsalary