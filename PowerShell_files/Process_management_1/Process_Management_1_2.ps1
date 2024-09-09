clear

Get-Process | Where-Object {$_.Path -ne "*system32*"}

