# 1. Küsi kasutajalt nime ja salvesta see muutujasse $Nimi
$Nimi = Read-Host -Prompt "What is your name"

# 2. Väljasta vastus rohelise värviga
Write-Host "Your name is: $Nimi" -ForegroundColor Green