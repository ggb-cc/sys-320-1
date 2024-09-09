cd\

cd \Users\champuser\Desktop\PowerShell_Files

clear

$files = (Get-ChildItem)

for ($i = 0 ; $i -le $files.Count ; $i ++ )
{

    if($files[$i].Name -ilike "*ps1")
    {
    Write-Host $files[$i].Name

    }
    
}


