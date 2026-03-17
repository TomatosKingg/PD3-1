$dokumentu_mape = [System.IO.Path]::Combine($env:USERPROFILE, "Documents")
$faila_cels = Join-path $dokumentu_mape "Errors.txt"
$pagatne = (Get-Date).AddDays(-7)

$kludas = Get-WinEvent -FilterHashtable @{LogName='System'; Level=2; StartTime=$pagatne} -ErrorAction SilentlyContinue

$pazinojums = if ($kludas.count -gt 10)
{ "[KRITISKI] Sistema ir nestabila!" }
else
{ "[OK] Kludu limenis normals." }

$pazinojums | Out-File -FilePath $faila_cels
$kludas | Select-Object TimeCreated, Message | Out-File -FilePath $faila_cels -Append

Write-Host "Analize pabeigta. Rezultati saglabati: $faila_cels"