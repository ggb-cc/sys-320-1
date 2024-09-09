clear

$folderPath = "\Users\champuser\Desktop\PowerShell_Files\outfolder\"
$filePath = Join-Path $folderPath "stopped_services.csv" 

Get-Service | Where-Object -Property Status -EQ "stopped" | Sort-Object | Export-Csv -Path $filePath
