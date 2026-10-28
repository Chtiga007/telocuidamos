Add-Type -AssemblyName System.Drawing
$bmp = [System.Drawing.Bitmap]::FromFile("C:\Users\Maranatha 2\Desktop\Te Lo Cuidamos\grooming_ref.png")

# Scan row Y=350 from X=1100 to 1550 to find beige card
$minX = 1600; $maxX = 0
for ($x = 1100; $x -lt 1580; $x++) {
    $c = $bmp.GetPixel($x, 350)
    if ($c.R -lt 250 -or $c.G -lt 250 -or $c.B -lt 250) {
        if ($x -lt $minX) { $minX = $x }
        if ($x -gt $maxX) { $maxX = $x }
    }
}
Write-Host "Card 1 X range at Y=350: $minX to $maxX"

# Scan col X=1350 from Y=200 to 800 to find top & bottom
for ($y = 250; $y -lt 750; $y += 10) {
    $c = $bmp.GetPixel(1350, $y)
    Write-Host "Y=$y : R=$($c.R) G=$($c.G) B=$($c.B)"
}
$bmp.Dispose()
