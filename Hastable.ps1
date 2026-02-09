# 1. Loo Hashtable 1 (Töötatud päevad)
$Hashtable1 = @{"John"=12; "Joe"=20; "Mary"=18}

# 2. Loo Hashtable 2 (Päevatasu)
$Hashtable2 = @{"John"=100; "Joe"=120; "Mary"=150}

# 3. Loo Hashtable 3 ja arvuta väärtused
$Hashtable3 = @{}
$Hashtable1.Keys | % { 
    $Hashtable3[$_] = $Hashtable1[$_] * $Hashtable2[$_] 
}

# VÄLJUND: Kutsume välja kõik kolm tabelit
Write-Host "--- Hashtable 1 ---"
$Hashtable1

Write-Host "`n--- Hashtable 2 ---"
$Hashtable2

Write-Host "`n--- Hashtable 3 (Arvutatud) ---"
$Hashtable3