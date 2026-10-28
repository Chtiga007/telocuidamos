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
# Dog: clean from Y=240 to Y=730 (height 490), X=530 to X=1140 (width 610)
Crop-Image "$base\grooming_ref.png" "$base\assets\hero_dog_clean.png" 530 240 610 500

# Top card
Crop-Image "$base\grooming_ref.png" "$base\assets\card_poodle_clean.png" 1255 315 245 165

# Bottom card
Crop-Image "$base\grooming_ref.png" "$base\assets\card_pack_clean.png" 1255 498 245 165
