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

# Ask user input
$firstName = Read-Host "Sisesta kasutaja eesnimi"
$lastName = Read-Host "Sisesta kasutaja perenimi"

# Generate username firstname.lastname
$username = ($firstName + "." + $lastName).ToLower()
$username = Translit($username)

# Check if user exists
$user = Get-ADUser -Filter "SamAccountName -eq '$username'" -ErrorAction SilentlyContinue

if ($user) {
    # Try to delete user
    Remove-ADUser -Identity $username -Confirm:$false -ErrorAction SilentlyContinue

    if ($?) {
        Write-Host "User '$username' was deleted successfully." -ForegroundColor Green
    } else {
        Write-Host "Failed to delete user '$username'." -ForegroundColor Red
    }
} else {
    Write-Host "User '$username' does not exist." -ForegroundColor Yellow
}