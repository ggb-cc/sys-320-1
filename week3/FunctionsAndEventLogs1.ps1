clear

#Get-EventLog System -Source Microsoft-Windows-Winlogon

function LogOnOffSince ($startpoint)
{

    $loginouts = Get-EventLog System -Source Microsoft-Windows-Winlogon -After (get-date).AddDays($startpoint) 

    $loginoutsTable = @()

    for ($i = 0 ; $i -lt $loginouts.Count ; $i ++) 
    {
        $event = ""

        if ($loginouts[$i].Message -ilike "*on*"){$event = "Logon"}
        if ($loginouts[$i].Message -ilike "*off*"){$event = "Logoff"}

        $userSID = New-Object -TypeName System.Security.Principal.SecurityIdentifier ($loginouts[$i].ReplacementStrings[1]) # give sid
        $userName = $userSID.Translate([System.Security.Principal.NTAccount])

        $loginoutsTable += [pscustomobject]
        @{
            "Time : " = $loginouts[$i].TimeWritten
            "ID : " = $loginouts[$i].Index
            "Event : " = $event
            "User : " = $userName
        }
    }
    $loginoutsTable
}



function PowerOnOffSince ($startpoint)
{

    $loginouts = Get-EventLog System -Source Microsoft-Windows-Winlogon -After (get-date).AddDays($startpoint) 

    $loginoutsTable = @()

    for ($i = 0 ; $i -lt $loginouts.Count ; $i ++) 
    {
        $event = ""

        if ($loginouts[$i].Message -ilike "*on*"){$event = "Logon"}
        if ($loginouts[$i].Message -ilike "*off*"){$event = "Logoff"}

        $userSID = New-Object -TypeName System.Security.Principal.SecurityIdentifier ($loginouts[$i].ReplacementStrings[1]) # give sid
        $userName = $userSID.Translate([System.Security.Principal.NTAccount])

        $loginoutsTable += [pscustomobject]
        @{
            "Time : " = $loginouts[$i].TimeWritten
            "ID : " = $loginouts[$i].Index
            "Event : " = $event
            "User : " = $userName
        }
    }
    $loginoutsTable
}


Get-Eventlog  # | Where-Object{$_.Index }