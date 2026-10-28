$html = Get-Content -Raw -Path "C:\Users\Maranatha 2\Desktop\Te Lo Cuidamos\dribbble_dump.html"
$regex = [regex]'<div class="shot-desc[^"]*">(.*?)</div>'
if ($html -match 'shot-desc.*?>(.*?)</div') {
    Write-Host "Description: " $matches[1]
}
if ($html -match 'name="description" content="(.*?)"') {
    Write-Host "Meta Description: " $matches[1]
}
