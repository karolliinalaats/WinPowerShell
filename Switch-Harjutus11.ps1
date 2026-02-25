# Küsime kasutajalt numbrid ja muudame need komakohtadega arvudeks (double)
$num1 = Read-Host "Enter first number"
$num2 = Read-Host "Enter second number"

# Kuvame menüü
Write-Host "Calculator" -ForegroundColor Green
Write-Host "1: Addition" -ForegroundColor Yellow
Write-Host "2: Subtraction" -ForegroundColor Yellow
Write-Host "3: Division" -ForegroundColor Yellow
Write-Host "4: Multiplication" -ForegroundColor Yellow

$choice = Read-Host "Enter your choice"

# Sooritame arvutused vastavalt valikule
switch ($choice) {
    "1" {
        $result = [double]$num1 + [double]$num2
        Write-Host "Sum is : $result"
    }
    "2" {
        $result = [double]$num1 - [double]$num2
        Write-Host "Difference is : $result"
    }
    "3" {
        if ([double]$num2 -eq 0) {
            Write-Host "Viga: Nulliga ei saa jagada!" -ForegroundColor Red
        } else {
            $result = [double]$num1 / [double]$num2
            Write-Host "Quotient is : $result"
        }
    }
    "4" {
        $result = [double]$num1 * [double]$num2
        Write-Host "Product is : $result"
    }
    Default {
        Write-Host "Vale valik!" -ForegroundColor Red
    }
}