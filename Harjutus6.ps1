# 1. SAMM: Algse CSV-faili loomine
$algandmed = @"
Name,Age
John,8
Joe,12
Mary,7
Tom,15
Lily,16
Emily,9
"@

$algandmed | Out-File -FilePath "opilased.csv" -Encoding utf8

# 2. SAMM: CSV importimine ja andmete töötlemine (loogika lisamine)
$opilased = Import-Csv -Path "opilased.csv"

$tulemus = $opilased | Select-Object Name, @{
    Name = "School"
    Expression = {
        $vanus = [int]$_.Age
        # Junior: 4-10 | Senior: 11-17
        if ($vanus -ge 4 -and $vanus -le 10) {
            "Junior"
        }
        elseif ($vanus -ge 11 -and $vanus -le 17) {
            "Senior"
        }
    }
}

# 3. SAMM: Tulemuse kuvamine ekraanil (kontrolliks)
Write-Host "Töödeldud andmed:" -ForegroundColor Cyan
$tulemus | Format-Table -AutoSize

# 4. SAMM: Tulemuse eksportimine uude CSV-faili
$tulemus | Export-Csv -Path "kooliaste_tulemus.csv" -NoTypeInformation -Encoding utf8

Write-Host "Kõik tehtud! Fail 'kooliaste_tulemus.csv' on loodud." -ForegroundColor Green