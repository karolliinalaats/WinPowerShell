# i. Leia kõik Notepadi protsessid ja kuva nende ID-d eraldi ridadena
Write-Host "--- Notepad Protsessid ---" -ForegroundColor Cyan

# Kasutame ForEach-Object, et kindlustada iga ID kuvamine eraldi real
Get-Process -Name "notepad" -ErrorAction SilentlyContinue | ForEach-Object {
    $_ | Select-Object ProcessName, Id
}

# ii. Failide info ja suuruse arvutamine
$path = "C:\Temp\Test"

if (Test-Path $path) {
    Write-Host "`nDirectory: $path" -ForegroundColor Yellow
    # Kuva kõik failid kaustas
    Get-ChildItem -Path $path

    # Leia CSV fail ja arvuta selle suurus
    $csvFile = Get-ChildItem -Path $path -Filter "*.csv" | Select-Object -First 1

    if ($csvFile) {
        $sizeKB = $csvFile.Length / 1KB
        $sizeMB = $csvFile.Length / 1MB

        Write-Host "`nFileName : $($csvFile.Name)"
        Write-Host "Size in KB : $sizeKB"
        Write-Host "Size in MB : $sizeMB"
    }
}