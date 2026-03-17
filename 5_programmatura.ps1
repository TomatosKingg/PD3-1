$upgrade_output = winget upgrade | Select-Object -Skip 2

$programmas = $upgrade_output | Where-Object { $_ -match "^\S" -and $_ -notmatch "atjauinajumi pieejami" }

$skaits = if ($null -eq $programmas)
{ 0 } else { $programmas.Count }

Write-Host "Sistema ir $skaits programmas, kuras nepieciesams atjauninat."