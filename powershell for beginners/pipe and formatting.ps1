Write-Host "Pipeline or pipe and formatting" -ForegroundColor Cyan
Get-Date

Get-Date | Fl

Get-Date | Format-List

Get-Service BITS | Format-List

Get-Service BITS | Format-List *

Get-Service BITS | Format-List *name*

Get-Date | Format-Table

Get-Date | FT

Get-Service BITS | Format-Table

Get-Service BITS | Format-Table -AutoSize

Get-Service BITS | Format-Table -Auto

Get-Service a*

Get-Service a* | Sort-Object Status

Get-Service EventLog

Get-Service EventLog | fl

$service = Get-Service EventLog | Select Name,Status
$service