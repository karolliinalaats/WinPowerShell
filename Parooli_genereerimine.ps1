# 1. Parooli genereerija
function Generate-RandomPassword {
    $chars = "ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz23456789!@#$%"
    return (-join (1..12 | ForEach-Object { $chars[(Get-Random -Maximum $chars.Length)] }))
}

# 2. Asukohad (WinPowerShell kaustas)
$csvFile = "C:\Users\Administrator\WinPowerShell\kasutajad.csv"
$logFile = "C:\Users\Administrator\WinPowerShell\kasutajanimed.csv"

# 3. Importimine - kasutame sinu faili päiseid: Username;FullName;Description
$users = Import-Csv $csvFile -Encoding UTF8 -Delimiter ";"

foreach ($user in $users) {
    # Kasutame Username ja FullName välju sinu failist
    $Username = $user.Username.ToLower()
    $DisplayName = $user.FullName
    
    if (Get-ADUser -Filter "SamAccountName -eq '$Username'" -ErrorAction SilentlyContinue) {
        Write-Host "Kasutaja $Username on juba olemas - jatan vahele." -ForegroundColor Yellow
    }
    else {
        try {
            $plainPassword = Generate-RandomPassword
            $securePassword = ConvertTo-SecureString $plainPassword -AsPlainText -Force

            # Loome kasutaja
            New-ADUser -Name $DisplayName `
                       -SamAccountName $Username `
                       -UserPrincipalName "$Username@sv-kool.local" `
                       -AccountPassword $securePassword `
                       -Enabled $true `
                       -Description $user.Description `
                       -ErrorAction Stop

            # Salvestame info faili (See on Ülesande eesmärk)
            $logEntry = [PSCustomObject]@{
                Kasutajatunnus = $Username
                Nimi           = $DisplayName
                GenereeritudParool = $plainPassword
            }
            $logEntry | Export-Csv -Path $logFile -Append -NoTypeInformation -Encoding UTF8

            Write-Host "Kasutaja $Username loodud! Parool: $plainPassword" -ForegroundColor Green
        }
        catch {
            Write-Host "Viga kasutaja $Username loomisel: $($_.Exception.Message)" -ForegroundColor Red
        }
    }
}