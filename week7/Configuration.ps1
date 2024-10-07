

function readConfiguration(){
    cd..
    $fileData = (get-content Users\champuser\Desktop\sys-320-1\week7\Configuration.txt).`
        Split([Environment]::NewLine)
    $formattedData = [pscustomobject] @{
                                        "Days" = $fileData[0]; `
                                        "Time" = $fileData[1];
                                       }
    $formattedData | Format-Table
}

function editConfiguration(){
    $days = read-host -Prompt "Enter New value for days"
    if ($days -match "[0-9]*")
    {
    $time = read-host -Prompt "Enter New value for time"
        if ($time -match "[0-9]{0,1}.:[0-9]{2}\s[AP]M"){
            cd..
            set-content -path Users\champuser\Desktop\sys-320-1\week7\Configuration.txt -Value "$days`n$time"
        
        }
        else{
        write-host "Invalid input for time value"
        }
    } 
    else{
    write-host "Invalid input for days value"
    }
}

function configurationMenu(){

$menuLoop = $true
While($menuLoop){
clear
$prompt = @()
$prompt += "`n1 : View Configuration"
$prompt += "`n2 : Edit Configuration"
$prompt += "`n3 : Exit"
Write-Host " - MENU - "
write-host $prompt
$input = read-host 

if ($input -eq "1")
{
    clear
    Write-Host " - VIEW CONFIG FILE - "

    readConfiguration

    Pause
}
 
elseif ($input -eq "2")
{
    clear
    Write-Host " - EDIT CONFIG FILE - `n"

    editConfiguration

    pause
} 
elseif ($input -eq "3")
{
    write-host "`n`nClosing menu`n"
    $menuLoop = $false
    pause
} 
else
{
    write-host "User input not understood"
}
}
}


configurationMenu