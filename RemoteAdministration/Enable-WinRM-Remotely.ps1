# Enable WinRM via WMI and Launch a Remote Shell on a Specific Workstation
# Uses WMI/DCOM to remotely execute Enable-PSRemoting

   #Replace "computername" example with hostname
   $SessionArgs = @{
       ComputerName  = "computername"
       Credential    = Get-Credential
       SessionOption = New-CimSessionOption -Protocol Dcom
       }
   $MethodArgs = @{
       ClassName     = 'Win32_Process'
       MethodName    = 'Create'
       CimSession    = New-CimSession @SessionArgs
       Arguments     = @{
           CommandLine = "powershell Start-Process powershell -ArgumentList 'Enable-PSRemoting -Force'"
           }
       }
    Invoke-CimMethod @MethodArgs
   
   # Launch a remote shell
   Enter-PSSession -ComputerName "computername"
