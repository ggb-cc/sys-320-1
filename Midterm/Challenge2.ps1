function GetFormattedApacheLogs(){
    $logsUnformatted = Get-Content C:\Users\champuser\Downloads\access.log; #C:\xampp\apache\logs\access.log;
    $tableRecords = @();

    for ($i=0; $i -lt $logsUnformatted.Length ; $i ++){
            $words = $logsUnformatted[$i].Split(" ");

            $tableRecords += [pscustomobject]@{
                                                "IP"       = $words[0];                 `
                                                "Time"     = $words[3].Trim('[');       `
                                                "Method"   = $words[5].Trim('"');       `
                                                "Page"     = $words[6];                 `
                                                "Protocal" = $words[7];                 `
                                                "Response" = $words[8];                 `
                                                "Referrer" = $words[10];                `
                                                "Client"   = $words[11..($words.Count)];
                                                }


            }
    return $tableRecords | Where-Object {$_.IP -ilike "*[0-9].*"} #| Format-Table
}

