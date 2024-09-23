

function GetApacheLog($page, $HTTPcode, $browser)
{
$selectedLogs = Get-Content C:\xampp\apache\logs\access.log | select-string -Pattern $page | Select-String -Pattern $HTTPcode | select-string -Pattern ("`"" + $browser)
$regex = [regex] "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"

$ipsUnorgonized = $regex.Matches($selectedLogs)

$ips = @()

for ($i = 0 ; $i -lt $ipsUnorgonized.count; $i++){
    $ips += [pscustomobject]@{"IP" = $ipsUnorgonized[$i].value; }
}

$ips | Where-Object { $_.IP -ilike "10.*"}

$selectedLogs

}


clear
GetApacheLog "page1" "200" "mozilla" 