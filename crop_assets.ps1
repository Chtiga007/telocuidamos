Add-Type -AssemblyName System.Drawing

function Crop-Image($sourcePath, $targetPath, $x, $y, $w, $h) {
    $src = [System.Drawing.Bitmap]::FromFile($sourcePath)
    $rect = New-Object System.Drawing.Rectangle($x, $y, $w, $h)
    $crop = $src.Clone($rect, $src.PixelFormat)
    $crop.Save($targetPath, [System.Drawing.Imaging.ImageFormat]::Png)
    $crop.Dispose()
    $src.Dispose()
    Write-Host "Saved $targetPath ($w x $h)"
}

$base = "C:\Users\Maranatha 2\Desktop\Te Lo Cuidamos"
# Dog in the center
Crop-Image "$base\grooming_ref.png" "$base\assets\hero_dog_cavalier.png" 520 220 620 650
# Cards on the right
Crop-Image "$base\grooming_ref.png" "$base\assets\hero_card_poodle.png" 1200 270 280 180
Crop-Image "$base\grooming_ref.png" "$base\assets\hero_card_pack.png" 1200 460 280 180
