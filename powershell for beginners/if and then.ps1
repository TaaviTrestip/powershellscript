Write-Host "If/Then" -ForegroundColor Cyan

$i = 10
$j = 5
Write-Host "Value I is: $i"
Write-Host "Value J is: $j"
if ($i -gt $j)
{
Write-Host "$i is greater than $j"
}
else
{
Write-Host "$j is greater than $i"
}

Write-Host "Service checker thingy" -ForegroundColor Cyan

$service = Get-Service Spooler | Select Status

if($service.Status -eq "Running")
{
Write-Host "Service is Good" -ForegroundColor Green
}
elseif ($service.Status -eq "Stopped")
{
Write-Host "Service is Bad" -ForegroundColor Red
}

Write-Host "Practice 4" -ForegroundColor Red
Write-Host "Part I" -ForegroundColor Red

$num1 = Read-Host "Enter the first number: "
$num2 = Read-Host "Enter the second number: "

if ($num1 -gt $num2) {
    Write-Host "The higher number is: $num1"
}
elseif ($num2 -gt $num1) {
    Write-Host "The higher number is: $num2"
}
else {
    Write-Host "Both numbers are equal"
}

Write-Host "Part II" -ForegroundColor Red

Write-Host "Select Country:" -ForegroundColor Yellow
Write-Host "1 : India" -ForegroundColor Cyan
Write-Host "2 : Australia" -ForegroundColor Cyan
Write-Host "3 : China" -ForegroundColor Cyan

$choice = Read-Host "Please select country: "

if ($choice -eq 1) {
    Write-Host "India's capital is New Delhi"
}
elseif ($choice -eq 2) {
    Write-Host "Australia's capital is Canberra"
}
elseif ($choice -eq 3) {
    Write-Host "China's capital is Beijing"
}
else {
    Write-Host "Invalid selection"
}