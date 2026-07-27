# A simple ICMP host discovery sweep using Test-Connection. For larger networks, use Nmap.
# Uses RFC 5737 documentation subnet as an example

   # Update as required for a given subnet
   $Subnet="192.0.2"
   
   1..254 | ForEach-Object {
       "$Subnet.$($_): $(Test-Connection -Count 1 -ComputerName "$Subnet.$($_)" -Quiet)"
   }
