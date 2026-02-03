$Array1 = @(1, 2, 3)
$Array2 = @(4, 5, 6)

# Loome tühja massiivi ja täidame selle tsükliga
$Array3 = for($i=0; $i -lt 3; $i++) { $Array1[$i] + $Array2[$i] }

# Kontroll
$Array3