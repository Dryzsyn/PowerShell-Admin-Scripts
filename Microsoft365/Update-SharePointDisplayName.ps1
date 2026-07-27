# When a security group gets renamed in AD/O365, it doesn't update the display name automatically in SharePoint. Use this script to update the name to match the new AD name.
# Connect to SharePoint Online (or Teams) and update imported user's display name

   # Install the PnP Module if not already installed
   Install-Module -Name PnP.PowerShell
   
   # Define site and connect (connect once per session)
   $SiteURL = "https://tenant.sharepoint.com/sites/SiteName"
   Connect-PnPOnline -Url $SiteURL -Interactive
   
   # Define user parameters
   $UserID = "c:0t.c|tenant|xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" # Example SharePoint claims ID
   $NewDisplayName = "NewGroupName" #Example updated group name
   
   # Get the user
   $User = Get-PnPUser -Identity $UserID
   
   # Update the user display name
   $User.Title = $NewDisplayName
   $User.Update()
   Invoke-PnPQuery
   
   # Reset variables
   Remove-Variable * -ErrorAction SilentlyContinue;