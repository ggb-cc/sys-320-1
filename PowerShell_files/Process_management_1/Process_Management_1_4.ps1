clear



function openChamplain(){

    if ((Get-Process -Name "*chrome*" ) -eq $null)
    {
        cd\
        Start-Process "\Program Files\Google\Chrome\Application\chrome.exe" 'https://www.champlain.edu'
    }
    else 
    {
        Stop-Process -Name "*chrome*"
    }

}