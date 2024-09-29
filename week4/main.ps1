. (Join-path $PSScriptRoot "Apache-logs.ps1")
. (Join-Path $PSScriptRoot "ParsingApacheLogs.ps1")

clear

$ips = GetApacheLog "page1" "200" "mozilla" | Group-Object IP

$ips | Select-Object Count, Name

Write-Host " -------------- ";

$a = ApacheLogs1

$a | Format-Table -AutoSize -Wrap