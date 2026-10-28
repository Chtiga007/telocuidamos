Add-Type -AssemblyName System.Drawing

$src = [System.Drawing.Bitmap]::FromFile("C:\Users\Maranatha 2\Desktop\Te Lo Cuidamos\assets\logo_cropped_transparent.png")
$w = $src.Width
$h = $src.Height

# Create footer version: replace dark navy/black text with white, keeping teal and coral
$footerBmp = New-Object System.Drawing.Bitmap($w, $h, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)

for ($y = 0; $y -lt $h; $y++) {
    for ($x = 0; $x -lt $w; $x++) {
        $c = $src.GetPixel($x, $y)
        if ($c.A -gt 20) {
            # Check if this pixel is dark (text / navy)
            # If R, G, B are all low and saturation is low, it's text
            $isTeal = ($c.G -gt $c.R + 25) -and ($c.B -gt $c.R + 20)
            $isCoral = ($c.R -gt $c.B + 40) -and ($c.R -gt 150)
            
            if (-not $isTeal -and -not $isCoral -and ($c.R -lt 100 -and $c.G -lt 100 -and $c.B -lt 100)) {
                # Turn dark text into crisp pure white
                $footerBmp.SetPixel($x, $y, [System.Drawing.Color]::FromArgb($c.A, 255, 255, 255))
            } else {
                # Preserve original teal and coral colors
                $footerBmp.SetPixel($x, $y, $c)
            }
        } else {
            $footerBmp.SetPixel($x, $y, [System.Drawing.Color]::FromArgb(0, 0, 0, 0))
        }
    }
}

$footerBmp.Save("C:\Users\Maranatha 2\Desktop\Te Lo Cuidamos\assets\logo_cropped_footer.png", [System.Drawing.Imaging.ImageFormat]::Png)
$footerBmp.Dispose()
$src.Dispose()
Write-Host "Footer logo generated!"
