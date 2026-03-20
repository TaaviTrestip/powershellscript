# Function to change UTF-8 to LATIN
function Translit {
    param(
        [string] $inputString
    )

    $Translit = @{
        [char]'ä' = "a"
        [char]'ö' = "o"
        [char]'ü' = "u"
        [char]'õ' = "o"
    }

    $outputString=""

    foreach ($character in $inputString.ToCharArray())
    {
        if ($Translit[$character] -cne $Null){
            $outputString += $Translit[$character]
        } else {
            $outputString += $character
        }
    }

    Write-Output $outputString
}

# Generate password function
function GenerateStrongPassword ([Parameter(Mandatory=$true)][int]$PasswordLenght)
{
    Add-Type -AssemblyName System.Web
    $PassComplexCheck = $false
    do {
        $newPassword=[System.Web.Security.Membership]::GeneratePassword($PasswordLenght,1)
        If ( ($newPassword -cmatch "[A-Z\p{Lu}\s]") `
        -and ($newPassword -cmatch "[a-z\p{Ll}\s]") `
        -and ($newPassword -match "[\d]") `
        -and ($newPassword -match "[^\w]") )
        {
            $PassComplexCheck=$True
        }
    } While ($PassComplexCheck -eq $false)

    return $newPassword
}

# Location of the AD users file
$file = "C:\Users\Administrator\Documents\adkasutajad.csv"

# Import the file
$users = Import-Csv $file -Encoding UTF8 -Delimiter ";"

# Array for later results
$results = @()

# Foreach user show the user
foreach ($user in $users){

    # Generate username in the format firstname.lastname
    $username = $user.FirstName + "." + $user.LastName
    $username = $username.ToLower()
    $username = Translit($username)

    # Generate password
    $password = GenerateStrongPassword(10)

    # User Principal name
    $upname = $username + "@trestip-sv-kool.local"
    # Display Name
    $displayname = $user.FirstName + " " + $user.LastName

    # Check if user already exists
    $existingUser = Get-ADUser -Filter "SamAccountName -eq '$username'" -ErrorAction SilentlyContinue

    if ($existingUser) {
        Write-Host "User '$username' already exists. Skipping." -ForegroundColor Yellow
    } else {
        # Create the user
        New-ADUser -Name $username `
            -DisplayName $displayname `
            -GivenName $user.FirstName `
            -Surname $user.LastName `
            -Department $user.Department `
            -Title $user.Role `
            -UserPrincipalName $upname `
            -AccountPassword (ConvertTo-SecureString $password -AsPlainText -Force) `
            -Enabled $true

        # Check if creation succeeded
        if ($?) {
            Write-Host "New user '$username' was created successfully." -ForegroundColor Green

            # Save to results
            $results += [PSCustomObject]@{
                Username = $username
                Password = $password
            }

        } else {
            Write-Host "Adding user '$username' failed." -ForegroundColor Red
        }
}

}

# Export CSV file
$results | Export-Csv ".\kasutajanimi.csv" -NoTypeInformation -Encoding UTF8

# Check users
$hour_ago = ((Get-Date).AddHours(-1))
Get-ADUser -Filter {(whencreated -ge $hour_ago)} -Properties whencreated | Select-Object Name, UserPrincipalName, SamAccountName, whencreated