# i) Funktsioonid ilma parameetriteta
function countstart {
    $running = (Get-Service | Where-Object {$_.Status -eq "Running"}).Count
    Write-Host "Total services in running state =  $running"
}

function countstop {
    $stopped = (Get-Service | Where-Object {$_.Status -eq "Stopped"}).Count
    Write-Host "Total services in stopped state =  $stopped"
}

# ii) Funktsioon koos parameetriga
function countservice {
    param(
        [string]$status
    )
    $count = (Get-Service | Where-Object {$_.Status -eq $status}).Count
    Write-Host "Total services in $($status.ToLower()) state =  $count"
}

# --- TESTIMINE (et näha tulemust nagu pildil) ---
Write-Host "--- Osa 1 ---" -ForegroundColor Cyan
countstart
countstop

Write-Host "`n--- Osa 2 ---" -ForegroundColor Cyan
countservice -status Running
countservice -status Stopped