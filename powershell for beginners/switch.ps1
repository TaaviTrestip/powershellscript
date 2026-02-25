# Switch
Write-Host "Switch" -ForegroundColor Cyan

Write-Host "Check Service Status" -ForegroundColor Green
Write-Host "1: Check status of Windows Audio service" -ForegroundColor Yellow
Write-Host "2: Check status of Print Spooler service" -ForegroundColor Yellow
Write-Host "3: Check status of Netlogon service" -ForegroundColor Yellow
$choice = Read-Host "Please enter your choice"
switch($choice)
{
1
{
Get-Service Audiosrv
}
2
{
Get-Service Spooler
}
3
{
Get-Service Netlogon
}
}

# Practice 11
Write-Host "Practice 11" -ForegroundColor Red
$num1 = [double](Read-Host "Enter first number")
$num2 = [double](Read-Host "Enter second number")

Write-Host ""
Write-Host "Calculator"
Write-Host "1: Addition"
Write-Host "2: Subtraction"
Write-Host "3: Division"
Write-Host "4: Multiplication"

$choice = Read-Host "Enter your choice"
switch ($choice) {
    "1" {
        $result = $num1 + $num2
        Write-Host "Sum is: $result"
    }
    "2" {
        $result = $num1 - $num2
        Write-Host "Difference is: $result"
    }
    "3" {
        if ($num2 -eq 0) {
            Write-Host "Cannot divide by zero!"
        }
        else {
            $result = $num1 / $num2
            Write-Host "Quotient is: $result"
        }
    }
    "4" {
        $result = $num1 * $num2
        Write-Host "Product is: $result"
    }
    Default {
        Write-Host "Invalid choice!"
    }
}