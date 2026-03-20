# 1. Küsi kasutaja ees- ja perenimi (Read-Host)
$eesnimi = Read-Host "Sisesta kasutaja eesnimi"
$perenimi = Read-Host "Sisesta kasutaja perenimi"

# 2. Loo kasutajanimi ees.perenimi ja muuda väiketähtedeks (.ToLower())
$kasutajaNimi = "$eesnimi.$perenimi".ToLower()
$taisNimi = "$eesnimi $perenimi"

# 3. Määra parool (Parool1!)
$paroolTekstina = "Parool1!"
$secureParool = ConvertTo-SecureString $paroolTekstina -AsPlainText -Force

# 4. Loo kasutaja koos veakontrolliga (ErrorAction ja $?)
Write-Host "Proovin luua kasutajat: $kasutajaNimi..." -ForegroundColor Cyan

# Kasutame -ErrorAction SilentlyContinue, et peita süsteemne punane tekst
New-LocalUser -Name $kasutajaNimi `
              -Password $secureParool `
              -FullName $taisNimi `
              -Description "Loodud skriptiga: $taisNimi" `
              -ErrorAction SilentlyContinue

# Kontrollime, kas viimane käsk õnnestus ($?)
if ($?) {
    Write-Host "Kasutaja $kasutajaNimi on edukalt loodud!" -ForegroundColor Green
} else {
    # Kui ebaõnnestus, anname omalt poolt selge kirjelduse
    Write-Host "VIGA: Kasutaja $kasutajaNimi loomine ebaõnnestus!" -ForegroundColor Red
    Write-Host "Tõenäoliselt on sellise nimega kasutaja süsteemis juba olemas." -ForegroundColor Yellow
}
