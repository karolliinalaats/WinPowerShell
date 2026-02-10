# 1. Küsime kasutajalt kaks numbrit
# Kasutame [int], et PowerShell saaks aru, et need on numbrid, mitte tekst
$num1 = [int](Read-Host -Prompt "Sisesta esimene number")
$num2 = [int](Read-Host -Prompt "Sisesta teine number")

# 2. Võrdleme numbreid
if ($num1 -gt $num2) {
    Write-Host "The higher number is : $num1" -ForegroundColor Cyan
}
elseif ($num2 -gt $num1) {
    Write-Host "The higher number is : $num2" -ForegroundColor Cyan
}
else {
    Write-Host "Mõlemad numbrid on võrdsed!"
}