# 1. Sorteerimine (Sort-Object)
# Võtame kõik teenused, mis algavad A-ga, ja sorteerime need staatuse järgi
Write-Host "--- A-ga algavad teenused sorteeritud oleku järgi ---"
Get-Service A* | Sort-Object Status

# 2. Filtreerimine (Where-Object)
# Võtame kõik teenused ja filtreerime välja ainult need, mis parajasti JOOKSEVAD (Running)
Write-Host "`n--- Ainult jooksvad teenused ---"
Get-Service | Where-Object {$_.Status -eq "Running"}

# 3. Valimine (Select-Object)
# Võtame teenused ja kuvame ainult nime ja staatuse (mitte tervet tabelit)
Write-Host "`n--- Teenuste nimed ja olekud ---"
Get-Service S* | Select-Object Name, Status