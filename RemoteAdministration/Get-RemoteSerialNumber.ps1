# Get the Serial Number of a Remote Computer

   Get-CimInstance Win32_BIOS -ComputerName "computername" | Select-Object SerialNumber