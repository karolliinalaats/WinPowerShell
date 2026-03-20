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

# 1. Küsime kasutajalt andmed
$firstname = Read-Host "Please enter user firstname"
$lastname = Read-Host "Please enter user lastname"

# 2. Teeme nime põhjal kasutajanime (translit ja väikesed tähed)
$rawUsername = ($firstname + "." + $lastname).ToLower()
$Username = Translit($rawUsername)

# 3. Kustutamise katse
try {
    # Kontrollime esmalt, kas kasutaja on olemas (ErrorAction Stop sunnib vea catch-plokki)
    Get-ADUser -Identity $Username -ErrorAction Stop | Out-Null
    
    # Kustutame kasutaja ilma kinnitust küsimata (-Confirm:$false)
    Remove-ADUser -Identity $Username -Confirm:$false -ErrorAction Stop
    
    Write-Host "User $firstname $lastname is removed succesfully" -ForegroundColor Green
}
catch {
    # Kui Get-ADUser või Remove-ADUser ebaõnnestub
    Write-Host "User not exists or problem is occuring during user removing, please try again" -ForegroundColor Red
}
