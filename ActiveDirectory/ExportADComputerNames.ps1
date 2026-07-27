# Export a list of computer names in Active Directory to a CSV file
# Modify the $OUpath to change which group of computers you'd like to query from Active Directory.
# When using relative paths, the file will be created in the directory shown in the PowerShell command window, another option is to set it a full path.

   # Set the OU path to query
   $OUpath = 'OU=Self Checkouts,DC=example,DC=com'
   
   # Create a CSV file if one doesn't exist
   If (!(Test-Path ".\hostnames.csv")){
      New-Item -path .\ -name hostnames.csv -type "file"
      }
   
   # Set the output file to a variable
   $ExportPath = '.\hostnames.csv'
   
   # Query Active Directory for all computers in the OU and output their hostnames to the CSV file
   Get-ADComputer -Filter * -SearchBase $OUpath | Select-Object Name | Export-CSV -NoType $ExportPath
