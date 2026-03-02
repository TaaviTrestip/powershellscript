# Defineerime parameetrid
#param(
#$kasutajanimi,
#$taisnimi,
#$kontokirjeldus
#)
#$kasutajanimi=$args[0]
#$taisnimi=$args[1]
#$kontokirjeldus=$args[2]

# Kontrollime parameetreid
if($args.Count -ne 3){
    echo '.\SkriptiNimi kasutajanimi "Ees Perenimi" "Konto kirjeldus"'
} else {
    $kasutajanimi=$args[0]
    $taisnimi=$args[1]
    $kontokirjeldus=$args[2]
    # Parool
    $KasutajaParool = ConvertTo-SecureString "qwerty" -AsPlainText -Force
    # Lisame kasutaja
    New-LocalUser "$kasutajanimi" -Password $KasutajaParool -FullName "$taisnimi" -Description "$kontokirjeldus"
}

# Parool
#$KasutajaParool = ConvertTo-SecureString "qwerty" -AsPlainText -Force
# Lisame kasutaja
#New-LocalUser "$kasutajanimi" -Password $KasutajaParool -FullName "$taisnimi" -Description "$kontokirjeldus"