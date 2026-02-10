# 1. Otsime teenuseid, mis algavad tähega 'S'
Write-Host "--- Teenused, mis algavad S-iga ---"
Get-Service S*

# 2. Otsime teenuseid, mille nimes on 'Net' (tärnid mõlemas otsas)
Write-Host "`n--- Teenused, mille nimes on 'Net' ---"
Get-Service *Net*

# 3. Kasutame vahemikku: teenused, mis algavad A, B või C-ga
Write-Host "`n--- Teenused vahemikus A kuni C ---"
Get-Service [a-c]*