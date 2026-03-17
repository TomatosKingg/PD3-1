$disk = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"
$brivais_procents = ($disk.FreeSpace / $disk.Size) * 100
$dokumentu_mape = [System.IO.Path]::Combine($env:USERPROFILE, "Documents")
$zurnals = Join-Path $dokumentu_mape "Apkope.log"
$datums_laiks = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

if ($brivais_procents -lt 25) {
$pirms = (Get-ChildItem $env:TEMP -Recurse -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum


Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
Clear-RecycleBin -DriveLetter C -Confirm:$false -ErrorAction SilentlyContinue


$atbrivots_gb = [Math]::Round($pirms / 1GB, 2)

$zinoms = "[$datums_laiks] Tirisana veikta. Atbrivoti $atbrivots_gb GB."
$zinoms | Out-File -FilePath $zurnals -Append
Write-Host $zinoms
} else {
$zinoms = "[$datums_laiks] Vieta pietiekama."
$zinoms | Out-File -FilePath $zurnals -Append
Write-Host $zinoms
}