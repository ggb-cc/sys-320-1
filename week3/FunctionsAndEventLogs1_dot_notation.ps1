.  (Join-Path $PSScriptRoot FunctionsAndEventLogs1.ps1)


$power = GetPowerOnOffSince 7
$power

$signIn = GetLogOnOffSince 7
$signIn