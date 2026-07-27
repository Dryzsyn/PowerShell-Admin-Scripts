# Count EnvisionWare OneStop self checkout transactions
# To query a pre-defined list rather than AD, move the comment blocks
<# Requires:
    - Windows PowerShell
    - RSAT Active Directory module
    - Permissions to read remote C$ shares
#>

   Import-Module ActiveDirectory

   $ReportFile = ".\Checkouts-YTD-2026.txt"
   $OUPath     = 'OU=Self Checkouts,DC=example,DC=com'
   #$ListPath   = ".\selfckos.csv" # Import hostnames from a pre-defined list
   $StartDate  = [datetime]'2026-01-01'
   
   if (!(Test-Path $ReportFile)) {
    New-Item -Path $ReportFile -ItemType File | Out-Null
   }
   
   # Comment out the following line when enabling $ListPath
   $ComputerNames = Get-ADComputer -Filter * -SearchBase $OUPath | Select-Object -ExpandProperty Name

<# 
   # Load hostnames from local file and filter out empty rows
   if (Test-Path $ListPath) {
    $ComputerNames = Get-Content -Path $ListPath | Where-Object { $_ -match '\S' }
   } else {
    Write-Error "Target list file not found at $ListPath."
    exit
   }
#>                 

   foreach ($ComputerName in $ComputerNames) {
   
   # Quick ICMP ping test to skip offline machines instantly and save execution time
    if (Test-Connection -ComputerName $ComputerName -Count 1 -Quiet) {
        $LogPath = "\\$ComputerName\c$\ProgramData\EnvisionWare\OneStop\logs\ewSelfCheck-userlog.txt*"
        $Files = Get-ChildItem $LogPath -ErrorAction SilentlyContinue | Where-Object LastWriteTime -gt $StartDate
   
        if ($Files) {
            # Force output into an array so .Count works consistently with 0, 1, or many matches
            $Count = @(Select-String -Path $Files.FullName -Pattern "AFItem checkout ok" -ErrorAction SilentlyContinue).Count
            "$ComputerName $Count" | Out-File $ReportFile -Append
        }
        else {
            "$ComputerName 0" | Out-File $ReportFile -Append
        }
    }
    else {
        # Instantly logs network failures without stalling the script
        "$ComputerName OFFLINE" | Out-File $ReportFile -Append
    }
   }
