# PowerShell equivalents for common Windows Service management tasks traditionally performed with sc.exe.
   
   # Identify a service either by status or name (replace Envisionware example name)
   Get-Service | Where-Object {$_.Status -eq "Running"}
   Get-Service | Where-Object {$_.DisplayName -like 'EnvisionWare*'}
   
   # Verify startup type (replace ewSystemMonitor example)
   Get-Service -Name ewSystemMonitor | Select-Object -property name,starttype
   
   # Stop service and change startup type (replace examples)
   Stop-Service ewSystemMonitor
   Set-Service -Name ewSystemMonitor -StartupType Disabled
