$procesi = Get-Process | Where-Object { $_.Name -ne "svchost" } | Sort-Object WS -Descending | Select-Object -First 5

$kopeja_atmina = ($procesi | Measure-Object -Property WS -Sum).Sum / 1MB

Write-Host "Top 5 procesu total RAM: "$ ([Math]::Round($kopeja_atmina, 1)) MB
