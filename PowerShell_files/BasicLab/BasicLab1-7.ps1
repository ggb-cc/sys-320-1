clear
#(Get-NetIPAddress -AddressFamily IPv4 | Where-Object {$_.InterfaceAlias -ilike "Ethernet0"}).IPAddress

#(Get-NetIPAddress -AddressFamily IPv4 | Where-Object {$_.InterfaceAlias -ilike "Ethernet0"}).PrefixLength

#Get-WmiObject -List | Where-Object {$_.Name -ilike "Win32_net*"} | Sort-Object

#Get-CimInstance Win32_NetworkAdapterConfiguration -Filter "DHCPEnabled=$true" | select DHCPServer | Format-Table -HideTableHeaders

#(Get-DnsClientServerAddress -AddressFamily IPv4 | Where-Object {$_.InterfaceAlias -ilike "Ethernet0"}).ServerAddresses[0]
