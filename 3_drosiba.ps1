$status = Get-MpComputerStatus
$dienas_kop_skenesanas = ((Get-Date) - $status.QuickScanEndTime).Days

if ($status.RealTimeProtectionEnabled -eq $false -or $dienas_kop_skenesanas -gt 3)
{ Write-Host "Sistema ir apdraudeta!" }
else 
{ Write-Host "sistema ir drosa." }