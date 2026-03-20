function Translit {
    param([string]$inputString)
    $TranslitTable = @{
        [char]'ä' = "a"; [char]'ö' = "o"; [char]'ü' = "u"; [char]'õ' = "o"
        [char]'Ä' = "a"; [char]'Ö' = "o"; [char]'Ü' = "u"; [char]'Õ' = "o"
    }
    $outputString = ""
    foreach ($character in $inputString.ToCharArray()) {
        if ($TranslitTable[$character] -ne $null) { $outputString += $TranslitTable[$character] }
        else { $outputString += $character }
    }
    return $outputString
}

$backupRoot = "C:\Backup"
$csvFile = "C:\Users\Administrator\WinPowerShell\kasutajad.csv"
$date = Get-Date -Format "dd.MM.yyyy"

if (-not (Test-Path $backupRoot)) { New-Item -Path $backupRoot -ItemType Directory | Out-Null }

$users = Import-Csv $csvFile -Encoding UTF8 -Delimiter ";"

foreach ($user in $users) {
    $username = Translit($user.Username.ToLower())
    $userHome = "C:\Users\$username"
    $zipPath = "$backupRoot\$username-$date.zip"

    # SIIN ON TRIKK: Kustutame vana kausta, et skript saaks uue luua ja tabelit näidata
    if (Test-Path $userHome) {
        Remove-Item -Path $userHome -Recurse -Force | Out-Null
    }

    # 1. KOLLANE KIRI
    Write-Host "Loodi ajutine kodukataloog: $userHome" -ForegroundColor Yellow
    
    # 2. TABEL (New-Item tekitab selle tabeli koos Mode ja LastWriteTime-ga)
    New-Item -Path $userHome -ItemType Directory -Force
    
    Set-Content -Path "$userHome\info.txt" -Value "Backup test"
    Write-Host "" # Tühi rida vahele

    try {
        # 3. ROHELINE KIRI
        Compress-Archive -Path "$userHome\*" -DestinationPath $zipPath -Force -ErrorAction Stop
        Write-Host "Kasutaja $username kodukataloog varundatud: $zipPath" -ForegroundColor Green
    }
    catch {
        Write-Host "Viga kasutaja $username varundamisel" -ForegroundColor Red
    }
}
