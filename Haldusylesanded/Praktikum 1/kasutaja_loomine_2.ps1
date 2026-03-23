# Fail, kus sees kasutajate andmed
$file="C:\Users\Taavi\powershellscript\uued yl\kasutajad.csv"
# Importime .csv faili korrektselt
$Kasutajad=Import-Csv $file -Encoding Default -Delimiter ";"
# Lisame iga kasutaja kasutades ForEach loopi
foreach ($kasutaja in $Kasutajad)
{
    $kasutajanimi = $kasutaja.Kasutajanimi
    $taisnimi = $kasutaja.Taisnimi
    $kontokirjeldus = $kasutaja.KontoKirjeldus
    $parool = $kasutaja.Parool | ConvertTo-SecureString -AsPlainText -Force
    # Kasutades siis saadud infot lisame kasutaja
    New-LocalUser "$kasutajanimi" -Password $parool -FullName "$taisnimi" -Description "$kontokirjeldus"
}