function getIOC{

    $page = Invoke-WebRequest -TimeoutSec 2 http://10.0.17.30/IOC.html

    $trs = $page.ParsedHtml.body.getElementsByTagName("tr")

    $fullTable = @()

    for ($i=1; $i -lt $trs.length; $i++)
    {
        
        $tds = $trs[$i].getElementsByTagName("td")
        
        $fullTable += [pscustomobject]@{
                                        "Pattern" = $tds[0].innerText; `
                                        "Description" = $tds[1].innerText; 
                                        }
    }

    
    return $fullTable
}

