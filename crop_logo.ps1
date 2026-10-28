Add-Type -AssemblyName System.Drawing

$srcPath = "C:\Users\Maranatha 2\Desktop\Te Lo Cuidamos\assets\logo_principal.jpg"
$bmp = [System.Drawing.Bitmap]::FromFile($srcPath)

$w = $bmp.Width
$h = $bmp.Height
Write-Host "Original image: $w x $h"

# Find bounds of colored content
# Background is off-white (around 248-255)
$minX = $w
$minY = $h
$maxX = 0
$maxY = 0

for ($y = 0; $y -lt $h; $y += 1) {
    for ($x = 0; $x -lt $w; $x += 1) {
        $c = $bmp.GetPixel($x, $y)
        # Check if pixel is not background (not near white/cream)
        # Background in logo_principal is around RGB(248, 246, 242) or similar
        if ($c.R -lt 240 -or $c.G -lt 238 -or $c.B -lt 235) {
            if ($x -lt $minX) { $minX = $x }
            if ($x -gt $maxX) { $maxX = $x }
            if ($y -lt $minY) { $minY = $y }
            if ($y -gt $maxY) { $maxY = $y }
        }
    }
}

Write-Host "Content bounds: X=$minX to $maxX, Y=$minY to $maxY"
$cropW = $maxX - $minX + 1
$cropH = $maxY - $minY + 1
Write-Host "Crop size: $cropW x $cropH"

# Add small padding around the logo (e.g. 10px)
$pad = 12
$pMinX = [Math]::Max(0, $minX - $pad)
$pMinY = [Math]::Max(0, $minY - $pad)
$pMaxX = [Math]::Min($w - 1, $maxX + $pad)
$pMaxY = [Math]::Min($h - 1, $maxY + $pad)
$finalW = $pMaxX - $pMinX + 1
$finalH = $pMaxY - $pMinY + 1

$cropped = New-Object System.Drawing.Bitmap($finalW, $finalH, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
$g = [System.Drawing.Graphics]::FromImage($cropped)
$g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality

# Clear with transparent or preserve background with color transparency
$destRect = New-Object System.Drawing.Rectangle(0, 0, $finalW, $finalH)
$srcRect = New-Object System.Drawing.Rectangle($pMinX, $pMinY, $finalW, $finalH)

$g.DrawImage($bmp, $destRect, $srcRect, [System.Drawing.GraphicsUnit]::Pixel)
$g.Dispose()

# Save tightly cropped png with full transparency for near-white pixels
$transBmp = New-Object System.Drawing.Bitmap($finalW, $finalH, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
for ($y = 0; $y -lt $finalH; $y++) {
    for ($x = 0; $x -lt $finalW; $x++) {
        $c = $cropped.GetPixel($x, $y)
        # If it's near the background cream color, make it transparent
        if ($c.R -gt 240 -and $c.G -gt 238 -and $c.B -gt 235) {
            $transBmp.SetPixel($x, $y, [System.Drawing.Color]::FromArgb(0, 255, 255, 255))
        } else {
            $transBmp.SetPixel($x, $y, $c)
        }
    }
}

$transPath = "C:\Users\Maranatha 2\Desktop\Te Lo Cuidamos\assets\logo_cropped_transparent.png"
$transBmp.Save($transPath, [System.Drawing.Imaging.ImageFormat]::Png)

# Also save an uncropped clean high-res without background
$cleanCropPath = "C:\Users\Maranatha 2\Desktop\Te Lo Cuidamos\assets\logo_cropped_clean.png"
$cropped.Save($cleanCropPath, [System.Drawing.Imaging.ImageFormat]::Png)

$transBmp.Dispose()
$cropped.Dispose()
$bmp.Dispose()
Write-Host "Saved cropped logos successfully!"
