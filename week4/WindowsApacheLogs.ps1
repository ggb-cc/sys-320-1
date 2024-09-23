clear
#cd\
#cd \Users\champuser\Desktop\sys-320-1\week4
#Get-Content Untitled1.ps1


# (2
#Get-Content C:\xampp\apache\logs\access.log 
# (3
#Get-Content C:\xampp\apache\logs\access.log | -last -5
# (4
#Get-Content C:\xampp\apache\logs\access.log | select-string ' 404 ', ' 400 '
# (5
#Get-Content C:\xampp\apache\logs\access.log | select-string ' 200 ' -NotMatch
# (6
#$a = Get-ChildItem C:\xampp\apache\logs\*.log | select-string 'error'
#$a[-1..-5]
# (7
$notFounds = Get-Content C:\xampp\apache\logs\access.log | select-string ' 404 ', ' 400 '
$regex = [regex] "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"

$ipsUnorgonized = $regex.Matches($notFounds)

$ips = @()

for ($i = 0 ; $i -lt $ipsUnorgonized.count; $i++){
    $ips += [pscustomobject]@{"IP" = $ipsUnorgonized[$i].value; }
}

$ips | Where-Object { $_.IP -ilike "10.*"}

# (8

$ipsoftens = $ips | Where-Object { $_.IP -ilike "10.*"}
$counts = $ipsoftens | group IP
$counts  | Select-Object Count, Name