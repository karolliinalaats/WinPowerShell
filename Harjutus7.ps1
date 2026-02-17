# 1. Defineerime värvid
$varvid = @("Red", "Green", "Yellow", "Blue")

# 2. Loome 20 õpilast ja määrame suvalise värvi
$tulemus = 1..20 | ForEach-Object {
    [PSCustomObject]@{
        RollNumber = $_
        Group      = Get-Random -InputObject $varvid
    }
}

# 3. Kuvame tabeli ekraanil
Write-Host "Õpilaste jaotus gruppidesse:" -ForegroundColor Cyan
$tulemus | Format-Table -AutoSize

# 4. Salvestame tulemuse CSV-faili (valikuline, aga soovitatav)
$tulemus | Export-Csv -Path "grupi_jaotus.csv" -NoTypeInformation -Encoding utf8