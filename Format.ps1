# 1. Format-List (FL) - näeme kõiki Get-Date detaile
Write-Host "--- Get-Date kõik atribuudid (FL *) ---"
Get-Date | Format-List *

# 2. Format-Table (FT) koos AutoSize-iga
# Ilma -Auto-ta võib DisplayName olla katki (truncated)
Write-Host "`n--- Teenus 'BITS' korralikult vormindatud tabelina ---"
Get-Service BITS | Format-Table Name, DisplayName, Status -AutoSize

# 3. Sorteerimine (Sort-Object)
# Sorteerime teenused nime järgi
Write-Host "`n--- Teenused sorteeritud nime järgi ---"
Get-Service A* | Sort-Object Name | Format-Table -Auto

# 4. Select-Object - andmete "püüdmine"
# Erinevalt FT-st, lubab Select andmeid hiljem uuesti kasutada
Write-Host "`n--- Valime välja ainult Name ja Status ---"
$minuTeenused = Get-Service | Select-Object Name, Status
$minuTeenused | Select-Object -First 5