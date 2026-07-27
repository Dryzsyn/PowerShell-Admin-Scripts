# Connect to Exchange Online - Change Mailboxes with Default Retention Policy to "Company Staff" policy

   # Connect to Exchange Online Shell - Replace <username> with yours
   Import-Module ExchangeOnlineManagement
   Connect-ExchangeOnline
   
   # Original Method
   $usernames = (ForEach {Get-Mailbox -ResultSize Unlimited | Select-Object Alias, RetentionPolicy | where {$_.retentionpolicy -like 'Default MRM Policy'}} | Select-Object Alias)
   ForEach ($username in $usernames){
   Set-Mailbox $username.Alias -RetentionPolicy "Company Staff"}
   
   # Microsoft's Method
   $OldPolicy=(Get-RetentionPolicy "Default MRM Policy").distinguishedName
   Get-Mailbox -Filter "RetentionPolicy -eq '$OldPolicy'" -Resultsize Unlimited | Set-Mailbox -RetentionPolicy "Company Staff"
