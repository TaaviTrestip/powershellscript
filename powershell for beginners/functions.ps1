# Functions
Write-Host "Functions" -ForegroundColor Cyan

function hi
{
Write-Host "My name is John" -ForegroundColor Green
Write-Host "My age is 30" -ForegroundColor Yellow
Write-Host "I like PowerShell" -ForegroundColor Cyan 
}

hi

function hi2
{
param
(
[string]$name,
[int]$age
)

Write-Host "My name is "$name -ForegroundColor Green
Write-Host "My age is "$age -ForegroundColor Yellow
Write-Host "I like PowerShell" -ForegroundColor Cyan 
}

hi2 -name Joe -age 35


# Practice 12
Write-Host "Practice 12" -ForegroundColor Red
function countrunning
{
$start = Get-Service | where{$_.Status -eq "Running"}
Write-Host "Total services running = "$start.count
}
function countstopped
{
$stop = Get-Service | where{$_.Status -eq "Stopped"}
Write-Host "Total services stopped = "$stop.count
}
countrunning
countstopped

function countservices
{
param
(
[string]$status
)
if($status -eq "Running")
{
$start = Get-Service | where{$_.Status -eq "Running"}
Write-Host "Total services running = "$start.count
}
elseif($status -eq "Stopped")
{
$stop = Get-Service | where{$_.Status -eq "Stopped"}
Write-Host "Total services stopped = "$stop.count
}
}
countservices -status Running
countservices -status Stopped

# Practice 13
Write-Host "Practice 13" -ForegroundColor Red

function Show-MainMenu {
    Clear-Host
    Write-Host "CALCULATOR"
    Write-Host "1. Calculate Area"
    Write-Host "2. Exit"
}

function Show-AreaMenu {
    Clear-Host
    Write-Host "AREA CALCULATOR"
    Write-Host "1. Area of Square"
    Write-Host "2. Area of Rectangle"
    Write-Host "3. Area of Circle"
    Write-Host "4. Area of Triangle"
}

do {
    Show-MainMenu
    $mainChoice = Read-Host "Enter your choice"

    switch ($mainChoice) {

        "1" {
            Show-AreaMenu
            $areaChoice = Read-Host "Choose shape"

            switch ($areaChoice) {

                "1" {
                    [double]$side = Read-Host "Enter side of square"
                    $result = $side * $side
                }

                "2" {
                    [double]$length = Read-Host "Enter length"
                    [double]$width  = Read-Host "Enter width"
                    $result = $length * $width
                }

                "3" {
                    [double]$radius = Read-Host "Enter radius"
                    $result = [math]::PI * $radius * $radius
                }

                "4" {
                    [double]$base = Read-Host "Enter base"
                    [double]$height = Read-Host "Enter height"
                    $result = 0.5 * $base * $height
                }

                Default {
                    Write-Host "Invalid shape option!"
                    $result = $null
                }
            }

            if ($result -ne $null) {
                Write-Host ""
                Write-Host "Calculated Area: $([math]::Round($result,2))"
            }

            do {
                Write-Host ""
                Write-Host "1. Back to Main Menu"
                Write-Host "2. Exit"

                $postChoice = Read-Host "Enter your choice"

                switch ($postChoice) {
                    "1" { break }
                    "2" { exit }
                    Default { Write-Host "Invalid option! Try again." }
                }

            } while ($postChoice -ne "1")
        }

        "2" {
            Write-Host "Exiting..."
            exit
        }

        Default {
            Write-Host "Invalid option! Try again."
            Start-Sleep 2
        }
    }

} while ($true)