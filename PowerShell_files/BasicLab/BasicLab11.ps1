clear
cd\
cd C:\Users\champuser\Desktop\PowerShell_files



$file = Get-ChildItem -Recurse -file
$file | Rename-Item -NewName { $_.Name -replace '.csv','.log' }
Get-ChildItem -Recurse -file
