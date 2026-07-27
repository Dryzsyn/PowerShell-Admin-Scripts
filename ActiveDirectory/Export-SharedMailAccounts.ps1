# Export generic/shared email address accounts/names for non-staff

   # Import AD Module if RSAT isn't installed on your computer
   Import-Module ActiveDirectory

   # Set multiple OUs to a variable
   $OUs = 'OU=Service Accounts,DC=example,DC=com', 'OU=Vendors,DC=example,DC=com'
   
   # Search the OUs for user accounts with email addresses and export them to a CSV file
   $OUs | ForEach-Object {Get-ADUser -SearchBase $_ -Properties EmailAddress, DisplayName, samaccountname -Filter {EmailAddress -like '*'} | Select-Object EmailAddress, DisplayName } | Export-CSV .\non_staff_emails.csv