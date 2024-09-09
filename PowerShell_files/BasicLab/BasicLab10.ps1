cd\

cd \Users\champuser\Desktop\PowerShell_Files

clear

$files = (Get-ChildItem)
$folderPath = "\Users\champuser\Desktop\PowerShell_Files\outfolder\"
$filePath = Join-Path $folderPath "out.csv"

$files | Where-Object {$_.Extension -eq ".ps1"} | Export-Csv -Path $filePath