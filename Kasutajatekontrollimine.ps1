function Translit {
    param([string]$inputString)
    $TranslitTable = @{
        [char]'ä' = "a"; [char]'ö' = "o"; [char]'ü' = "u"; [char]'õ' = "o"
        [char]'Ä' = "a"; [char]'Ö' = "o"; [char]'Ü' = "u"; [char]'Õ' = "o"
    }
    $outputString = ""
    foreach ($character in $inputString.ToCharArray()) {
        if ($TranslitTable[$character] -ne $null) {
            $outputString += $TranslitTable[$character]
        } else {
            $outputString += $character
        }
    }
    return $outputString
}

$file = "C:\Users\Administrator\Documents\adusers.csv"
$domain = "sv-kool.local"
$users = Import-Csv $file -Encoding UTF8 -Delimiter ";"

foreach ($user in $users) {
    $rawUsername = ($user.FirstName + "." + $user.LastName).ToLower()
    $Username = Translit($rawUsername)
    $displayName = $user.FirstName + " " + $user.LastName
    $upn = $Username + "@" + $domain
    $securePassword = ConvertTo-SecureString $user.Password -AsPlainText -Force

    $existingUser = Get-ADUser -Filter "SamAccountName -eq '$Username'" -ErrorAction SilentlyContinue

    if ($existingUser) {
        Write-Host "User $Username already exists - can not add this users" -ForegroundColor Yellow
    }
    else {
        try {
            New-ADUser -Name $Username `
                       -DisplayName $displayName `
                       -GivenName $user.FirstName `
                       -Surname $user.LastName `
                       -Department $user.Department `
                       -Title $user.Role `
                       -UserPrincipalName $upn `
                       -SamAccountName $Username `
                       -AccountPassword $securePassword `
                       -Enabled $true `
                       -ErrorAction Stop
            
            Write-Host "New user $Username added succesfully" -ForegroundColor Green
        }
        catch {
            Write-Host "Error adding $Username" -ForegroundColor Red
        }
    }
}