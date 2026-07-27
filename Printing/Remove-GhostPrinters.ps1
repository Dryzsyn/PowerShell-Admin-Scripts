# Sometimes a computer with printers deployed via Group Policy will end up with duplicate "ghost" copies of the same printer. 
# This script will uninstall all copies of the printer based on the "Friendly Name". The device should reinstall the correct one again after a gpupdate or reboot.
   
# Remove all devices in SWD\PRINTENUM with a specific FriendlyName using pnputil
   
   $printerName = "Central City Front Desk Printer"
   
   # Enumerate all subkeys under PRINTENUM
   $keys = Get-ChildItem "HKLM:\SYSTEM\CurrentControlSet\Enum\SWD\PRINTENUM"
   
   foreach ($key in $keys) {
       try {
           $props = Get-ItemProperty $key.PSPath
   
           # Only target devices with the matching FriendlyName
           if ($props.FriendlyName -eq $printerName) {
   
               # Build the PnP device instance path
               $deviceInstanceId = "SWD\PRINTENUM\$($key.PSChildName)"
   
               # Remove the device using pnputil
               Write-Host "Removing device: $deviceInstanceId"
               pnputil /remove-device "$deviceInstanceId"
           }
       } catch {
           Write-Warning "Could not process key $($key.PSPath): $_"
       }
   }
   
   Write-Host "Done removing all ghost printers named '$printerName'."
