# PrivateInternetAccessCheck
This PowerShell command will check to see if you are connected to your PIA VPN.

If you are not connected to the VPN it will Kill an applicaiton for you.

If you are connected to the VPN it can start a program for you automatically.

You can run the applicaiton from a PowerShell window with the following command:

.\KillPiaNotConnected.ps1 -appKill "Chrome" -appKillPath "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" -logPath "C:\KillLog.txt".

All paremters are needed.
