Add-Type -AssemblyName System.Drawing
$bmp = [System.Drawing.Bitmap]::FromFile("C:\Users\Maranatha 2\Desktop\Te Lo Cuidamos\assets\hero_dog_portrait.png")
$g = [System.Drawing.Graphics]::FromImage($bmp)
# Brush white over top-left corner where navbar text was
$brush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::White)
$g.FillRectangle($brush, 0, 0, 180, 45)
$brush.Dispose()
$g.Dispose()
$bmp.Save("C:\Users\Maranatha 2\Desktop\Te Lo Cuidamos\assets\hero_dog_clean_flawless.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
Write-Host "Done"
