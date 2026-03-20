# 1. Küsi kasutaja ees- ja perenimi (Read-Host)
$eesnimi = Read-Host "Sisesta kustutatava kasutaja eesnimi"
$perenimi = Read-Host "Sisesta kustutatava kasutaja perenimi"

# 2. Loo kasutajanimi ees.perenimi ja muuda väiketähtedeks (.ToLower())
$kasutajaNimi = "$eesnimi.$perenimi".ToLower()

# 3. Kustuta kasutaja ja peida süsteemne veateade (-ErrorAction SilentlyContinue)
Remove-LocalUser -Name $kasutajaNimi -ErrorAction SilentlyContinue

# 4. Kontrolli tulemust ($?) ja väljasta vastav teade
if ($?) {
    Write-Host "Kasutaja $kasutajaNimi kustutamine õnnestus!" -ForegroundColor Green
} else {
    Write-Host "VIGA: Kasutaja $kasutajaNimi kustutamine ebaõnnestus (või kasutajat ei eksisteeri)!" -ForegroundColor Red
}
