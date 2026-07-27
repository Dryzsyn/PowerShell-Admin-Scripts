# PowerShell Admin Scripts

A collection of PowerShell scripts developed for enterprise Windows environments. These examples demonstrate automation, Active Directory management, Microsoft 365 administration, remote administration, endpoint management, and reporting tasks commonly performed by systems administrators and IT professionals.

The scripts in this repository are intended as practical examples of real-world administrative tasks. They have been sanitized for public release by replacing organization-specific information (hostnames, domain names, IP addresses, tenant information, OU paths, etc.) with generic examples.

---

## Features

* Active Directory administration
* Microsoft 365 automation
* Exchange Online management
* SharePoint Online administration
* Windows service management
* Remote administration (RPC, WMI/CIM, WinRM)
* Endpoint automation
* Reporting and log parsing
* Network diagnostics
* PowerShell automation examples

---

## Requirements

Some scripts require one or more of the following:

* Windows PowerShell 5.1 or newer
* RSAT Active Directory module
* ExchangeOnlineManagement PowerShell module
* PnP.PowerShell module
* Administrative privileges
* Remote administrative access (RPC, SMB, WMI/CIM, or WinRM depending on the script)

Install modules when required:

```powershell
Install-Module ExchangeOnlineManagement
Install-Module PnP.PowerShell
```

---

# Repository Contents

## Active Directory

### Export-ADComputerNames.ps1

Exports all computer names from a specified Active Directory Organizational Unit (OU) to a CSV file.

**Use cases**

* Inventory workstations
* Create deployment lists
* Generate hostname reports

---

### Export-StaffUsers.ps1

Exports display names and email addresses for user accounts located within a specified Active Directory OU.

**Use cases**

* Staff directories
* Bulk email validation
* Microsoft 365 migrations

---

### Export-SharedMailAccounts.ps1

Searches multiple Organizational Units and exports shared, service, or vendor accounts that contain email addresses.

**Use cases**

* Shared mailbox audits
* Service account documentation
* Email migration planning

---

### Restart-ComputersInOU.ps1

Queries Active Directory for all computers in an Organizational Unit, verifies connectivity, and remotely restarts available systems.

Features:

* Automatic AD discovery
* Online/offline detection
* Remote reboot using WMI
* Error handling

Example modifications:

* Replace the reboot command with:

  * gpupdate
  * shutdown
  * custom CMD commands
  * software deployment commands

---

### Replace-TextInRemoteFiles.ps1

Connects to every computer within an Active Directory OU and performs a search-and-replace operation inside a configuration file.

Useful for:

* Configuration updates
* Software migrations
* Enterprise application management

---

## Microsoft 365

### Update-ExchangeRetentionPolicy.ps1

Updates mailboxes currently assigned the default Microsoft retention policy to a custom organizational retention policy.

Includes:

* Original iterative method
* Optimized Microsoft filtering method

---

### Update-SharePointDisplayName.ps1

Updates the SharePoint display name of imported users or security groups after they have been renamed in Active Directory or Microsoft 365.

Useful when SharePoint continues displaying outdated group names after directory changes.

---

## Remote Administration

### Enable-WinRM-Remotely.ps1

Uses WMI/CIM to remotely execute **Enable-PSRemoting**, allowing a PowerShell remoting session to be established without requiring prior WinRM configuration.

Features:

* Remote WMI/CIM execution
* Launches PowerShell remoting
* Useful during workstation provisioning

---

### Manage-RemoteProcesses.ps1

Demonstrates several methods of remotely managing Windows processes.

Includes:

* Enumerating remote processes
* Terminating processes using taskkill (RPC)
* Terminating processes using PowerShell Remoting (WinRM)

---

### Get-RemoteSerialNumber.ps1

Retrieves the BIOS serial number from a remote Windows computer using CIM.

Useful for:

* Asset inventories
* Hardware audits
* Warranty tracking

---

### Query-LoggedOnUser.ps1

Determines whether a user is currently logged onto a remote workstation by querying console sessions.

Useful for:

* Maintenance scheduling
* Remote support
* Software deployments

---

## Windows Administration

### Manage-WindowsServices.ps1

Examples demonstrating common Windows Service administration tasks.

Includes:

* List running services
* Search services by display name
* Verify startup type
* Stop services
* Change startup type

---

### Show-ListeningPorts.ps1

Displays listening TCP ports along with the associated executable.

Useful for:

* Troubleshooting
* Security investigations
* Identifying unknown services

---

### Show-MessageBox.ps1

Creates a simple Windows message box using PowerShell.

Useful for:

* User notifications
* Testing
* Interactive scripts

---

### Reset-PowerShellSession.ps1

Clears variables, imported modules, and error history to create a clean testing session.

Useful during:

* Script development
* Module testing
* Debugging

---

## Networking

### Ping-Sweep.ps1

Performs a simple ICMP host discovery sweep using PowerShell's **Test-Connection**.

Useful for:

* Discovering live hosts
* Basic network inventories
* Troubleshooting

For larger networks or advanced scanning, consider using Nmap.

---

## Reporting

### Get-EnvisionWareCheckoutCounts.ps1

Generates a Year-to-Date transaction report by reading EnvisionWare OneStop log files across multiple self-checkout workstations discovered through Active Directory.

Features:

* Automatic workstation discovery
* Online/offline detection
* Log file parsing
* Transaction counting
* Consolidated reporting

Demonstrates:

* Active Directory automation
* SMB administration
* Log parsing
* Reporting
* PowerShell scripting

---

## Printing

### Remove-GhostPrinters.ps1

Removes duplicate or "ghost" printer devices created through repeated Group Policy printer deployments.

The script:

* Enumerates PRINTENUM devices
* Matches printer Friendly Names
* Removes duplicate device instances using **pnputil**

Useful when systems accumulate dozens or hundreds of duplicate printer objects.

---

# Technologies Demonstrated

* PowerShell
* Active Directory
* RSAT
* Exchange Online
* Microsoft 365
* SharePoint Online
* WinRM
* WMI
* CIM
* RPC
* SMB
* CSV reporting
* Log parsing
* Windows Services
* Remote administration

---

# Security Notice

All examples have been sanitized before publication.

The following information has been replaced with generic examples:

* Domain names
* Organizational Units (OUs)
* Tenant URLs
* Hostnames
* Computer names
* IP addresses
* Usernames
* Email addresses
* Printer names
* Organization-specific identifiers

Review every script before using it in your own environment.

---

# License

This repository is provided for educational and administrative reference purposes.

Use these examples at your own risk and thoroughly test them before deploying in production environments.
