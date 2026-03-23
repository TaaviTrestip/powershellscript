Get-Command -Module Microsoft.PowerShell.LocalAccounts

Get-LocalUser

Get-LocalUser -Name "Taavi" | Select-Object *
Get-LocalUser -Name "Taavi" | Select-Object PasswordLastSet

# New-LocalUser "kasutaja1"

Remove-LocalUser -Name kasutaja1 -Verbose

$KasutajaParool = ConvertTo-SecureString "qwerty" -AsPlainText -Force

New-LocalUser "kasutaja1" -Password $KasutajaParool -FullName "Esimene Kasutaja" -Description "Local Account - kasutaja1"