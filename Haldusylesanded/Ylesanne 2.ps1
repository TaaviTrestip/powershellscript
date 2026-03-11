# Ylesanne 2 - lokaalse kasutaja kustutamine ees- ja perenime järgi

$eesnimi = Read-Host "Sisesta oma eesnimi"
$perenimi = Read-Host "Sisesta oma perenimi"

# Kontrollime kas ainult ladina tähed
if ($eesnimi -notmatch '^[A-Za-z]+$') {
    Write-Host "Eesnimi võib sisaldada ainult ladina tähti!" -ForegroundColor Red
    exit
}

if ($perenimi -notmatch '^[A-Za-z]+$') {
    Write-Host "Perenimi võib sisaldada ainult ladina tähti!" -ForegroundColor Red
    exit
}

$kasutajanimi = ($eesnimi + "." + $perenimi).ToLower()

Write-Host "Kustutav kasutaja on $kasutajanimi"

# Kontrollime kas kasutaja olemas
$existinguser = Get-LocalUser -Name $kasutajanimi -ErrorAction SilentlyContinue

if (!$existinguser) {
    Write-Host "Kasutajat $kasutajanimi ei eksisteeri!" -ForegroundColor Yellow
    exit
}

# Kustutame kasutaja
Remove-LocalUser -Name $kasutajanimi -ErrorAction SilentlyContinue

# Kontrollime kas kustutamine õnnestus
if ($?) {
    Write-Host "Kasutaja $kasutajanimi on kustutatud" -ForegroundColor Green
}
else {
    Write-Host "Tekkis probleem kasutaja kustutamisega" -ForegroundColor Red
}