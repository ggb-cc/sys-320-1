clear



function LogOnOffSince ($startpoint)
{

    $loginouts = Get-EventLog System -Source Microsoft-Windows-Winlogon -After (get-date).AddDays(-$startpoint) 

    $loginoutsTable = @()

    for ($i = 0 ; $i -lt $loginouts.Count ; $i ++) 
    {
        $event = ""

        if ($loginouts[$i].Message -ilike "*on*"){$event = "Logon"}
        if ($loginouts[$i].Message -ilike "*off*"){$event = "Logoff"}

        $userSID = New-Object -TypeName System.Security.Principal.SecurityIdentifier ($loginouts[$i].ReplacementStrings[1]) # give sid
        $userName = $userSID.Translate([System.Security.Principal.NTAccount])

        $loginoutsTable += [pscustomobject]@{"Time : " = $loginouts[$i].TimeWritten; 
                                               "ID : " = $loginouts[$i].InstanceID;
                                            "Event : " = $event;
                                             "User : " = $userName;
                                            }
    }
    $loginoutsTable
}


function PowerOnOffSince ($startpoint)
{

    $powerOnOffs = Get-EventLog system -After (get-date).AddDays(-$startpoint) | Where-Object {($_.EventID -eq 6006) -or ($_.EventID -eq 6005)}  

    $powerOnOffsTable = @()

    for ($i = 0 ; $i -lt $powerOnOffs.Count ; $i ++) 
    {
        $event = ""

        if ($powerOnOffs[$i].Message -ilike "*started*"){$event = "Shutdown"}
        if ($powerOnOffs[$i].Message -ilike "*stopped*"){$event = "Startup"}

        $userName = "System"

        $powerOnOffsTable += [pscustomobject]@{"Time : " = $powerOnOffs[$i].TimeWritten; 
                                                 "ID : " = $powerOnOffs[$i].EventID;
                                              "Event : " = $event;
                                               "User : " = $userName;
                                              }
    }
    $powerOnOffsTable
}
