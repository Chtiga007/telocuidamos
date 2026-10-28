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
# Card 1 full
Crop-Image "$base\grooming_ref.png" "$base\assets\card_poodle_full.png" 1245 310 250 170
# Card 2 full
Crop-Image "$base\grooming_ref.png" "$base\assets\card_pack_full.png" 1245 490 250 170
