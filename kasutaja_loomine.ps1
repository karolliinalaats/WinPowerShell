# 1. Parooli määramine turvalisel kujul (Sinu materjali põhjal)
$ParoolTekstina = "qwerty"
$KasutajaParool = ConvertTo-SecureString $ParoolTekstina -AsPlainText -Force

# 2. Faili asukoht (eeldame, et oled kaustas C:\Users\admin\powershellscript)
$failitee = "kasutajad.csv"

if (Test-Path $failitee) {
    # 3. Importimine ja tsükkel
    $kasutajad = Import-Csv -Path $failitee -Delimiter ";"
    
    foreach ($rida in $kasutajad) {
        $nimi = $rida.Username
        $taisNimi = $rida.FullName
        
        # Kontroll, et me ei loo topelt
        if (-not (Get-LocalUser -Name $nimi -ErrorAction SilentlyContinue)) {
            # Kasutaja loomine
            New-LocalUser -Name $nimi -Password $KasutajaParool -FullName $taisNimi
            Write-Host "Kasutaja $nimi ($taisNimi) on loodud!" -ForegroundColor Green
        } else {
            Write-Host "Kasutaja $nimi on juba süsteemis olemas." -ForegroundColor Yellow
        }
    }
} else {
    Write-Error "Faili $failitee ei leitud! Kontrolli, kas oled õiges kaustas."
}

# 4. Kuva tulemus kontrolliks
Get-LocalUser | Select-Object Name, FullName, Enabled