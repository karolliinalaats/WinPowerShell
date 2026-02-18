<#
.SYNOPSIS
    Practice 10: Monitorib Notepad protsesse kasutades do-until tsüklit.
#>

$counter = 0

do {
    Write-Host "Notepad is running"
    $counter++
    Start-Sleep -Seconds 1
} 
until (-not (Get-Process -Name "notepad" -ErrorAction SilentlyContinue))

# Kuvame korduste arvu
Write-Host $counter