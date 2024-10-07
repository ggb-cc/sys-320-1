
. "C:\Users\champuser\Desktop\sys-320-1\week4\ParsingApacheLogs.ps1"
. "C:\Users\champuser\Desktop\sys-320-1\week6\Files\Event-Logs.ps1"
. "C:\Users\champuser\Desktop\sys-320-1\PowerShell_files\Process_management_1\Process_Management_1_4.ps1"



$menuLoop = $true

$prompt = @()
$prompt += "`n1 - View apache logs"
$prompt += "`n2 - View failed login logs"
$prompt += "`n3 - View at risk users"
$prompt += "`n4 - Open champlain.edu"
$prompt += "`n5 - Exit`n"




while($menuLoop)
{

clear
Write-Host " - MENU - "
$menuInput = Read-Host -Prompt $prompt


#  -  exit
if($menuInput -eq "5")
{
clear
write-host " - EXITING - "
$menuLoop = $false
}


#  -  view last 10 apache logs
elseif($menuInput -eq "1")
{
clear
write-host " - LAST APACHE LOGS - "
$logs = ApacheLogs1
$logs | select -Last 10 | Format-Table
}


#  -  view last 10 failed sign in logs
elseif($menuInput -eq "2")
{
clear
write-host " - LAST FAILED LOGIN LOGS - "

$failedLogs = getFailedLogins 1000 # was unsure how exactly to get last 10 when the function is looking to AddDays with param. I ran into a strange bug when using [DateTime]::MaxValue.Day, I'm hoping that using the last 1000 days is an ok fix
$failedLogs | format-table | select -last 10
}


#  -  view at risk users
elseif($menuInput -eq "3")
{
    $input = Read-Host -Prompt "`nPlease enter the number of days you would like to look back"
    $riskyUsers = getAtRiskUsers $input
    $riskyUsers
}


#  -  Open champlain.edu
elseif($menuInput -eq "4")
{
    openChamplain
}
else
{
write-host "Input not understood"
}

pause
}
