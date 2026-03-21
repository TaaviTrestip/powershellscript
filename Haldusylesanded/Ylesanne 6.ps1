# Ylesanne 6

# Backup folder
$backupPath = "C:\Backup"
if (!(Test-Path $backupPath)) {
    New-Item -ItemType Directory -Path $backupPath
}

# Date for final file
$date = Get-Date -Format "dd.MM.yyyy"

# Local users
$users = Get-LocalUser

foreach ($user in $users) {
    $username = $user.Name
    
    # Users home directory
    $homePath = "C:\Users\$username"
    
    # Check if the directory exists
    if (Test-Path $homePath) {
        
        # Zip file
        $zipPath = "$backupPath\$username-$date.zip"
        
        # If a same date backup there remove the old one
        if (Test-Path $zipPath) {
            Remove-Item $zipPath
        }

        # Backing up
        Compress-Archive -Path "$homePath\*" -DestinationPath $zipPath

        Write-Host "Backed up: $username"
    }
    else {
        Write-Host "Home directory not found: $username"
    }
}