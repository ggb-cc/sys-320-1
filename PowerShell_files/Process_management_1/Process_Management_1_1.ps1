clear

Get-Process | Where-Object {$_.ProcessName -ilike "C*"}