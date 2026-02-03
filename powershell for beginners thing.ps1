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
# Practice 1
$array1 = @(1, 2, 3)
$array2 = @(4, 5, 6)

$array3 = @()

$array3 += $array1[0] + $array2[0]
$array3 += $array1[1] + $array2[1]
$array3 += $array1[2] + $array2[2]

$array3