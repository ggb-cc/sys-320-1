cd\

cd \Users\champuser\Desktop\PowerShell_Files

$FolderPath = "\Users\champuser\Desktop\PowerShell_Files\outfolder"

if (Test-Path $FolderPath)
    {
    Write-Host "Folder Already Exists"
    }
    else 
    {
    New-Item -ItemType Directory -Path $FolderPath 
    }


