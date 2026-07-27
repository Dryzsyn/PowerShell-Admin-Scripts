# Reboot all computers listed in a given OU in Active Directory
# This can also be used to run any remote command supported in Command Prompt

   $OUpath = 'OU=Self Checkouts,DC=example,DC=com'
   $hostnames = (Get-ADComputer -Filter * -SearchBase $OUpath | Select-Object -ExpandProperty Name)
   
   ForEach($hostname in $hostnames){
       # Ping the computer first to see if it is online then execute the command if it replies
       if(Test-Connection $hostname -Quiet) {
           try{
               # Customize the line below to remotely execute different functions i.e. "cmd.exe /c gpupdate /force"
               Invoke-WmiMethod -class Win32_process -name Create -ArgumentList ("cmd.exe /c shutdown -r -f -t 0") -ComputerName $hostname
               }
           # Display errors if command fails
           catch {
               throw $_.Exception.Message
           }
       }
       # List the hostname of any computer that does not send an echo reply
       else {
           Write-Host "Cannot reboot $hostname because it is not available."
       }
   }