$html = Get-Content -Raw -Path "C:\Users\Maranatha 2\Desktop\Te Lo Cuidamos\dribbble_dump.html"
if ($html -match '<title>(.*?)</title>') { Write-Host "Title: " $matches[1] }
if ($html -match '<meta property="og:title" content="(.*?)"') { Write-Host "og:title: " $matches[1] }
if ($html -match '<meta property="og:description" content="(.*?)"') { Write-Host "og:desc: " $matches[1] }
if ($html -match '<meta property="og:image" content="(.*?)"') { Write-Host "og:image: " $matches[1] }

$regex = [regex]'https://cdn\.dribbble\.com/userupload/[^"''\s>]+'
$matchesImg = $regex.Matches($html)
foreach ($m in $matchesImg | Select-Object -First 5) {
    Write-Host "Image URL: " $m.Value
}
