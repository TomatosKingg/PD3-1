$datums = Get-Date -Format "yyyy-MM-dd"
$avots = Join-Path ([System.IO.Path]::Combine($env:USERPROFILE, "Documents")) "Errors.txt"
$arhivs = "Atskaite_$($datums).zip"

if (Test-Path $avots) { Compress-Archive -Path $avots -DestinationPath $arhivs -Force

$izmers = (Get-Item $arhivs).Length / 1KB
Write-Host "Arhiva izmers: $([Math]::Round($izmers, 2)) KB" }
else
{ Write-Host "Fails Errors.txt netika atrasts. Palaidiet vispirms 2. skriptu." }