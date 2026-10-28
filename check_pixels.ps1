Add-Type -AssemblyName System.Drawing
$bmp = [System.Drawing.Bitmap]::FromFile('C:\Users\Maranatha 2\Desktop\Te Lo Cuidamos\grooming_ref.png')
Write-Host "Top-left 50,50:" $bmp.GetPixel(50, 50).ToString()
Write-Host "Center 800,600:" $bmp.GetPixel(800, 600).ToString()
Write-Host "X=200, Y=200:" $bmp.GetPixel(200, 200).ToString()
Write-Host "X=100, Y=300:" $bmp.GetPixel(100, 300).ToString()
$bmp.Dispose()
