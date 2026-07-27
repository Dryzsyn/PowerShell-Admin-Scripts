# Export a list of all accounts in an Active Directory Staff OU (names and email addresses)and export to a CSV file

       Get-ADUser -Filter * -SearchBase 'OU=Staff,OU=Users,DC=example,DC=com' -SearchScope OneLevel -Properties DisplayName, EmailAddress | Select-Object DisplayName, EmailAddress | Export-CSV -Path ".\Users.csv" -NoTypeInformation