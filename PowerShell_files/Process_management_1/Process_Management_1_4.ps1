clear

cd\

if ((Get-Process -Name "*chrome*" ) -eq $null)
{
    Start-Process "\Program Files\Google\Chrome\Application\chrome.exe" 'https://www.champlain.edu'
}
else 
{
    Stop-Process -Name "*chrome*"
}
