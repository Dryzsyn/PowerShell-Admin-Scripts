# Reset all variables and imported modules in a script (useful when testing script building)

   Remove-Variable * -ErrorAction SilentlyContinue; 
   Remove-Module *; $error.Clear();