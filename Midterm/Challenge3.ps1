. (Join-Path $PSScriptRoot Challenge1.ps1)
. (Join-Path $PSScriptRoot Challenge2.ps1)

function checkIOCLogs($logs, $IOC)
{

$indicatedLogs = @();

for($i = 0 ; $i -lt $IOC.Length ; $i++){
$indicatedLogs  +=  $logs| where-object {$_.Page -ilike -join ('*',$IOC.Pattern[$i],'*')};
}
return $indicatedLogs 
}

 
$LOGS = GetFormattedApacheLogs 
$ioc = getIOC

checkIOCLogs $LOGS $ioc | format-table


