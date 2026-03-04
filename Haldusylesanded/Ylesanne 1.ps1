# Ylesanne 1 - lokaalse kasutaja loomine tema ees- ja perenimi järgi

$eesnimi = Read-Host "Sisesta oma eesnimi: "
$perenimi = Read-Host "Sisesta oma perenimi: "

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
$taisnimi = "$eesnimi $perenimi"
$kontokirjeldus = "Lokaalne kasutaja $taisnimi"

# Kontrollib, kas kasutaja juba olemas
$existinguser = Get-LocalUser -Name $kasutajanimi -ErrorAction SilentlyContinue

if ($existinguser) {
    Write-Host "Kasutaja $kasutajanimi on juba olemas!" -ForegroundColor Yellow
    exit
}

$parool = ConvertTo-SecureString "Parool1!" -AsPlainText -Force

Write-Host "Loodav kasutaja on $kasutajanimi" 

# Loome kasutaja
New-LocalUser "$kasutajanimi" -Password $parool -FullName "$taisnimi" -Description "$kontokirjeldus" -ErrorAction SilentlyContinue

# Kontrollib käsu õnnestumist süsteemimuutuja $? abil
if ($?) {
    Write-Host "Kasutaja $kasutajanimi loodi edukalt!" -ForegroundColor Green
}
else {
    Write-Host "Kasutaja loomine ebaõnnestus!" -ForegroundColor Red
}