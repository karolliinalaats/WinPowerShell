# 1. Kuvame menüü
Write-Host "--- VALI RIIK ---"
Write-Host "1. Eesti"
Write-Host "2. Soome"
Write-Host "3. Läti"

# 2. Küsime valikut
$valik = Read-Host -Prompt "Sisesta valiku number (1-3)"

# 3. Kontrollime valikut
if ($valik -eq "1") {
    Write-Host "Eesti pealinn on Tallinn." -ForegroundColor Yellow
}
elseif ($valik -eq "2") {
    Write-Host "Soome pealinn on Helsinki." -ForegroundColor Yellow
}
elseif ($valik -eq "3") {
    Write-Host "Läti pealinn on Riia." -ForegroundColor Yellow
}
else {
    Write-Host "Sellist valikut ei ole!" -ForegroundColor Red
}