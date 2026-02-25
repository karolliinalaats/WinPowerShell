function Show-MainMenu {
    Clear-Host
    Write-Host "      Area Calculator" -ForegroundColor Green
    Write-Host "         Main Menu" -ForegroundColor Yellow
    Write-Host "`nPlease select the option to perform the respective task" -ForegroundColor Yellow
    Write-Host "`n1: Area of Square" -ForegroundColor Green
    Write-Host "2: Area of Rectangle" -ForegroundColor Green
    Write-Host "3: Area of Circle" -ForegroundColor Green
    Write-Host "4: Area of Triangle" -ForegroundColor Green
    Write-Host "5: Exit" -ForegroundColor Green
}

function Show-SubMenu {
    Write-Host "`nPlease select the next option" -ForegroundColor Yellow
    Write-Host "`n1: Return to Main Menu" -ForegroundColor Green
    Write-Host "2: Exit" -ForegroundColor Green
}

$running = $true

while ($running) {
    Show-MainMenu
    $choice = Read-Host "`nEnter your choice"

    switch ($choice) {
        "1" {
            Clear-Host
            Write-Host "      Area of Square" -ForegroundColor Green
            $side = Read-Host "`nEnter the side of the square"
            $area = [double]$side * [double]$side
            Write-Host "`nArea of the square :  $area" -ForegroundColor Green
        }
        "2" {
            Clear-Host
            Write-Host "      Area of Rectangle" -ForegroundColor Green
            $l = Read-Host "`nEnter length"
            $w = Read-Host "Enter width"
            $area = [double]$l * [double]$w
            Write-Host "`nArea of the rectangle :  $area" -ForegroundColor Green
        }
        "3" {
            Clear-Host
            Write-Host "      Area of Circle" -ForegroundColor Green
            $r = Read-Host "`nEnter the radius"
            # Pindala valem: pi * r^2
            $area = [Math]::PI * [Math]::Pow([double]$r, 2)
            Write-Host "`nArea of the circle :  $area" -ForegroundColor Green
        }
        "4" {
            Clear-Host
            Write-Host "      Area of Triangle" -ForegroundColor Green
            $b = Read-Host "`Enter the base"
            $h = Read-Host "Enter the height"
            # Pindala valem: (alus * kõrgus) / 2
            $area = ([double]$b * [double]$h) / 2
            Write-Host "`nArea of the triangle :  $area" -ForegroundColor Green
        }
        "5" {
            $running = $false
            continue
        }
        Default {
            Write-Host "Invalid choice, try again." -ForegroundColor Red
            Start-Sleep -Seconds 1
            continue
        }
    }

    # Kui valiti 1-4, siis näitame alammenüüd
    if ($running) {
        $subRunning = $true
        while ($subRunning) {
            Show-SubMenu
            $nextChoice = Read-Host "`nEnter your choice"
            if ($nextChoice -eq "1") { 
                $subRunning = $false 
            }
            elseif ($nextChoice -eq "2") { 
                $running = $false
                $subRunning = $false 
            }
            else { 
                Write-Host "`nEnter correct option" -ForegroundColor Red 
            }
        }
    }
}