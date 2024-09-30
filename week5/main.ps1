. (Join-Path $PSScriptRoot "ScrapingChamplainClasses.ps1")

$classes = gatherClasses
$fullTable = daysTranslater $classes

#  i
#$fullTable | Select-Object "class Code", Instructor, Location, Days, "Time Start", "Time End" | `
#    Where-Object{$_."Instructor" -ilike "Furkan Paligu"}



#  ii
#$fullTable | Where-Object{ ($_."Location" -ilike "JOYC 310") -and ($_."Days" -contains "Monday") } | `
#    Sort-object "Time Start" |
#    select "Time Start", "Time End", "Class Code";

#  iii
$ITSInstructors = $fullTable | Where-Object{ `
                            ($_."Class Code" -ilike "SYS*") -or `
                            ($_."Class Code" -ilike "NET*") -or `
                            ($_."Class Code" -ilike "SEC*") -or `
                            ($_."Class Code" -ilike "FOR*") -or `
                            ($_."Class Code" -ilike "CSI*") -or `
                            ($_."Class Code" -ilike "DAT*") }   `
                | Sort-Object "Instructor" `
                | Select-Object "Instructor" -Unique 
            


#  iv

$fullTable | Where { $_.Instructor -in $ITSInstructors.Instructor} `
                | Group-Object "Instructor" | Select-Object Count, Name | Sort-Object Count -Descending
