$nimi = Read-Host "Sisesta oma nimi"
$kordus = Read-Host "Mitu korda soovid tervitust näha?"

if ($kordus -as [int]) {
    $kordus = [int]$kordus
} else {
    Write-Host "Viga: Sa ei sisestanud arvu! Kasutan vaikimisi 1 kordust." -ForegroundColor Red
    $kordus = 1
}


$raport = @()
$raport += "--- SÜSTEEMI RAPORT ---"
$raport += "Kuupäev: $(Get-Date)" # Boonus: kuupäev ja kellaaeg


for ($i = 1; $i -le $kordus; $i++) {
    $tervitus = "Tere, $nimi! ($i)"
    Write-Host $tervitus -ForegroundColor Green
    $raport += $tervitus
}


$info = @"
Arvuti nimi: $env:COMPUTERNAME
Kasutaja: $env:USERNAME
PowerShell versioon: $($PSVersionTable.PSVersion)
"@
Write-Host $info
$raport += $info


$protsessid = Get-Process | Select-Object -First 3
$teenused = Get-Service | Select-Object -First 3 Name, Status

Write-Host "`n3 Töötavat protsessi:"
$protsessid | Format-Table | Out-String | Write-Host
$raport += "`n3 Töötavat protsessi:"
$raport += $protsessid | Format-Table | Out-String

Write-Host "3 Teenust:"
$teenused | Format-Table | Out-String | Write-Host
$raport += "`n3 Teenust:"
$raport += $teenused | Format-Table | Out-String


if ($PSVersionTable.PSVersion.Major -lt 5) {
    $v_teade = "HOIATUS: Sinu PowerShelli versioon on aegunud!"
    Write-Host $v_teade -ForegroundColor Red
} else {
    $v_teade = "PowerShelli versioon on sobiv."
    Write-Host $v_teade -ForegroundColor Cyan
}
$raport += $v_teade


$raport | Out-File -FilePath "report.txt" -Encoding utf8


Write-Host "`n===========================" -ForegroundColor Green
Write-Host "Script finished successfully" -ForegroundColor Green
Write-Host "===========================" -ForegroundColor Green