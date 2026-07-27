# Find and replace a block of text in a specific file for all computers listed in an OU in Active Directory

   $OUpath = 'OU=Self Checkouts,DC=example,DC=com'
   $hostnames = (Get-ADComputer -Filter * -SearchBase $OUpath | Select-Object -ExpandProperty Name)
   
   ForEach($hostname in $hostnames){
       # Customize the line below. Set the path for the file being updated.
       $Files = Get-ChildItem "\\$hostname\c$\ProgramData\EnvisionWare\OneStop\config\ewSelfCheck.ewp"
       $FileContent = Get-Content $Files
       # Customize the line below. Find and replace a block of text within the file and change it (pattern is "find, update").
       $UpdateConfig = $FileContent -replace "Show Patron Name'>1</entry>", "Show Patron Name'>0</entry>"
       $UpdateConfig | Set-Content -Path $Files
       }