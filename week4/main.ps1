. (Join-path $PSScriptRoot "Apache-logs.ps1")

clear

$ips = GetApacheLog "page1" "200" "mozilla" | Group-Object IP

$ips | Select-Object Count, Name
