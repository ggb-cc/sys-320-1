.  "C:\Users\champuser\Desktop\sys-320-1\week7\Configuration.ps1"
.  "C:\Users\champuser\Desktop\sys-320-1\week7\Email.ps1"
.  "C:\Users\champuser\Desktop\sys-320-1\week7\Scheduler.ps1"
.  "C:\Users\champuser\Desktop\sys-320-1\week6\Files\Event-Logs.ps1"


$configuration = getConfiguration 

$failedLogins = getAtRiskUsers $configuration.Days

sendAlertEmail ($failedLogins | Format-Table | Out-String)

ChooseTimeToRun($configuration.Time)
