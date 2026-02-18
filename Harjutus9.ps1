<#
.SYNOPSIS
    Practice 9: Monitorib Notepadi kasutades do-while tsüklit.
    Kuvab lõpus teate väljastamise kordade arvu.
#>

$counter = 0

do {
    Write-Host "Notepad is running"
    $counter++  # Suurendame loendurit ühe võrra
    Start-Sleep -Seconds 1
} 
while (Get-Process -Name "notepad" -ErrorAction SilentlyContinue)

# Kuvame lõpptulemuse, nagu pildil näidatud
Write-Host $counter