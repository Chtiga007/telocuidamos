Add-Type -AssemblyName System.Drawing

function Crop-Image($sourcePath, $targetPath, $x, $y, $w, $h) {
    $src = [System.Drawing.Bitmap]::FromFile($sourcePath)
    $rect = New-Object System.Drawing.Rectangle($x, $y, $w, $h)
    $crop = $src.Clone($rect, $src.PixelFormat)
    $crop.Save($targetPath, [System.Drawing.Imaging.ImageFormat]::Png)
    $crop.Dispose()
    $src.Dispose()
}

$base = "C:\Users\Maranatha 2\Desktop\Te Lo Cuidamos"
# Card 1 (Poodle with VIEW & arrow)
Crop-Image "$base\grooming_ref.png" "$base\assets\gallery_poodle.png" 1280 320 265 185

# Card 2 (Pack with VIEW & arrow)
Crop-Image "$base\grooming_ref.png" "$base\assets\gallery_pack.png" 1280 515 265 180

# Dog in center
Crop-Image "$base\grooming_ref.png" "$base\assets\hero_dog_portrait.png" 520 230 650 535
