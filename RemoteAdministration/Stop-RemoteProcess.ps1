# Use either RPC or WinRM to terminate a process on a remote computer

   # Terminate a process ID on a remote computer using taskkill (RPC)
   taskkill /S "computername" /PID 1337 /F

   # Terminate a process ID on a remote computer using PowerShell (Requires WinRM to be enabled on remote computer)
   Invoke-Command -ComputerName "computername" {
    Stop-Process -Id 1337 -Force
   }