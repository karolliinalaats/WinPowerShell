# We use a while loop to check if any 'notepad' processes exist
while (Get-Process -Name "notepad" -ErrorAction SilentlyContinue) {
    Write-Host "Notepad is running"
    
    # Adding a small sleep prevents the script from consuming 
    # too much CPU while it waits
    Start-Sleep -Seconds 1
}

Write-Host "All instances of Notepad are closed. Loop ended."