$mem = Get-CimInstance Win32_PerfFormattedData_PerfOS_Memory
$availGB = [math]::Round($mem.AvailableMBytes / 1024, 1)
$totalGB = [math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB, 1)
Write-Host "Available RAM: $availGB GB of $totalGB GB"
if ($availGB -lt 10) { Write-Host "Not enough RAM for the lab. Close heavy apps." -ForegroundColor Red }
else { Write-Host "OK to start the lab VMs." -ForegroundColor Green }
Get-Process | Group-Object Name | ForEach-Object {
  [pscustomobject]@{ Name = $_.Name; Procs = $_.Count; MB = [math]::Round(($_.Group | Measure-Object WorkingSet64 -Sum).Sum / 1MB) }
} | Sort-Object MB -Descending | Select-Object -First 10