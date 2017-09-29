param(
    [string]$appKill = "APP_NAME", 
    [string]$appFilePath = "FILE_PATH_FOR_EXECUTION",
    [string]$logPath = "LOT_FILE_PATH")

$WebResponse = Invoke-WebRequest "https://www.privateinternetaccess.com/"
$tags = $WebResponse.AllElements | Where {$_.TagName -eq "li"}
$tagCount = $tags.Count
$i = 0
$protected = 'False'
do 
{
    if ($tags[$i].outerText -eq "You are protected by PIA ")
        {
            $protected = 'True'
            Add-Content $logPath "`n $(Get-Date -Format g) : Protected"
        }
    $i = $i + 1
}
while($i -le $tagcount)
$process = Get-Process $appKill -ErrorAction SilentlyContinue
if ($protected -eq 'False')
    {
        if ($process)
        {
            $process.Kill()
            Add-Content $logPath "`n $(Get-Date -Format g) : Unprotected Process Killed"
        }else
        {
            echo 'Not Running'
            Add-Content $logPath "`n $(Get-Date -Format g) : Unprotected process not running"
        }
    }
else
    {   
        if ($process)
            {
                Add-Content $logPath "Running : Protected"
            }
        else
            {
                Start-Process -FilePath $appFilePath
                Add-Content $logPath "Started : Protected"
            }
    }
