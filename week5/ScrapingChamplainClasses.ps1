clear

#http://10.0.17.30/Courses.html


$page = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.30/Courses.html

$trs = $page.ParsedHtml.body.getElementsByTagName("tr")
$fullTable = @()

for ($i=1; $i -le $trs.length; $i++)
{
$tds = $trs.getElementsByTagName("td")

$times = $tds[5].innerText.Value("")
}






