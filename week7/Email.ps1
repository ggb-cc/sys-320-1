function sendAlertEmail($body)
{
$from = "griffin.goochbreault@mymail.champlain.edu"
$to = "griffin.goochbreault@mymail.champlain.edu"
$subject = "Suspicious Activity"

$password = "fjba ddaf nmwb ejhp" | ConvertTo-SecureString -AsPlainText -Force
$credential = new-object -TypeName System.Management.Automation.PSCredential -ArgumentList $from, $password

Send-MailMessage -From $from -to $to -Subject $subject -Body $body -SmtpServer "smtp.gmail.com" `
-port 587 -UseSsl -Credential $credential

}
clear 

#sendAlertEmail "Body of email"