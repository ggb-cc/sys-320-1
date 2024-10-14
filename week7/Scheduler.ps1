function ChooseTimeToRun($Time)
{

$scheduledTasks = Get-ScheduledTask | Where-Object { $_.TaskName -ilike "myTask"}

if($scheduledTasks -ne $null)
{
    write-host "The task already exists." | Out-String 
    DisableAutoRun
}
Write-host "Creating the new task" | out-string

$action = New-ScheduledTaskAction -Execute "powershell.exe" `
            -Argument "-File `"C:\Users\champuser\Desktop\sys-320-1\week7\main.ps1`""


$trigger = New-ScheduledTaskTrigger -Daily -At $time
$principal = New-ScheduledTaskPrincipal -UserId 'champuser' -RunLevel Highest
$settings = New-ScheduledTaskSettingsSet -RunOnlyIfNetworkAvailable -WakeToRun
$task = New-ScheduledTask -Action $action -Principal $principal -Trigger $trigger -Settings $settings

Register-ScheduledTask 'myTask' -InputObject $task

Get-ScheduledTask | Where-Object { $_.TaskName -ilike "myTask" }

}

function DisableAutoRun()
    {
    $scheduledTasks = Get-ScheduledTask | Where-Object { $_.TaskName -ilike "myTask"}

    if ($scheduledTasks -ne $null)
    {
        write-host "Unregistering the task." | Out-String
        Unregister-ScheduledTask -TaskName 'myTask' -Confirm:$false
    }
    else
    {
        write-host "the task is not registered." | Out-String 
    }


    
}

