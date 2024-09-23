#10.0.17.30

clear

$scraped_page = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.30/ToBeScraped.html

#$scraped_page.Links.Count

#$scraped_page.Links | Select outerText, href

<#
$h2s = $scraped_page.ParsedHtml.body.getElementsByTagName("h2") | Select outertext
$h2s
#>

$divs1 = $scraped_page.ParsedHtml.body.getElementsByTagName("div") |`
 Where {$_.getAttributeNode("class").value -ilike "div-1"} | select innerText
$divs1


