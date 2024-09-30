clear

#http://10.0.17.30/Courses.html

function gatherClasses(){
    $page = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.30/Courses.html

    $trs = $page.ParsedHtml.body.getElementsByTagName("tr")
    $fullTable = @()

    for ($i=1; $i -lt $trs.length; $i++)
        {
        $tds = $trs[$i].getElementsByTagName("td")

        $times = $tds[5].innerText.split("-")

        $fullTable += [pscustomobject]@{
                                        "Class Code" = $tds[0].innerText; `
                                        "Title"      = $tds[1].innerText; `
                                        "Days"       = $tds[4].innerText; `
                                        "Time Start" = $times[0]; `
                                        "Time End"   = $times[1]; `
                                        "Instructor" = $tds[6].innerText; `
                                        "Location"   = $tds[9].innerText; `
            }

        }

    return $fullTable
}

function daysTranslater($fullTable)
{

for ($i = 0 ; $i -lt $fullTable.Length; $i++)
{

    $days = @()
    if($fullTable[$i].Days -ilike "Mon"

}
}






