# PowerShell Admin Scripts

A collection of PowerShell scripts developed for enterprise Windows environments. These examples demonstrate automation, Active Directory management, Microsoft 365 administration, remote administration, endpoint management, reporting, and common systems administration tasks.

The scripts in this repository are based on real-world administrative workflows and have been sanitized for public release by replacing organization-specific information such as domains, hostnames, IP addresses, tenant information, and OU paths with generic examples.

---

## Table of Contents

* [Active Directory](#active-directory)
* [Microsoft 365](#microsoft-365)
* [Networking](#networking)
* [Printing](#printing)
* [Remote Administration](#remote-administration)
* [Reporting](#reporting)
* [Windows Administration](#windows-administration)
* [Requirements](#requirements)
* [Security Notice](#security-notice)

---

# Script Categories

## Active Directory

Scripts for managing, querying, and automating Active Directory tasks.

| Script                                                                         | Description                                                             |
| ------------------------------------------------------------------------------ | ----------------------------------------------------------------------- |
| [Export-ADComputerNames.ps1](ActiveDirectory/Export-ADComputerNames.ps1)       | Export computer names from an Active Directory OU to CSV.               |
| [Export-StaffUsers.ps1](ActiveDirectory/Export-StaffUsers.ps1)                 | Export staff display names and email addresses from Active Directory.   |
| [Export-SharedMailAccounts.ps1](ActiveDirectory/Export-SharedMailAccounts.ps1) | Export shared, service, and vendor accounts containing email addresses. |
| [Restart-ComputersInOU.ps1](ActiveDirectory/Restart-ComputersInOU.ps1)         | Restart computers discovered within an Active Directory OU.             |
| [Replace-TextInRemoteFiles.ps1](ActiveDirectory/Replace-TextInRemoteFiles.ps1) | Search and replace text in configuration files on remote computers.     |

---

## Microsoft 365

Scripts for Exchange Online and SharePoint Online administration.

| Script                                                                                | Description                                                                            |
| ------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- |
| [Update-ExchangeRetentionPolicy.ps1](Microsoft365/Update-ExchangeRetentionPolicy.ps1) | Update Exchange Online mailboxes from a default retention policy to a custom policy.   |
| [Update-SharePointDisplayName.ps1](Microsoft365/Update-SharePointDisplayName.ps1)     | Update imported SharePoint user or group display names after Active Directory changes. |

---

## Networking

Scripts for network troubleshooting and discovery.

| Script                                                        | Description                                                  |
| ------------------------------------------------------------- | ------------------------------------------------------------ |
| [Invoke-PingSweep.ps1](Networking/Invoke-PingSweep.ps1)       | Perform a simple ICMP host discovery sweep using PowerShell. |
| [Show-ListeningPorts.ps1](Networking/Show-ListeningPorts.ps1) | Display listening ports and associated processes.            |

---

## Printing

Scripts for printer management and troubleshooting.

| Script                                                        | Description                                                                    |
| ------------------------------------------------------------- | ------------------------------------------------------------------------------ |
| [Remove-GhostPrinters.ps1](Printing/Remove-GhostPrinters.ps1) | Remove duplicate printer devices created by repeated Group Policy deployments. |

---

## Remote Administration

Scripts demonstrating remote Windows administration using WMI/CIM, RPC, SMB, and WinRM.

| Script                                                                        | Description                                                          |
| ----------------------------------------------------------------------------- | -------------------------------------------------------------------- |
| [Enable-WinRM-Remotely.ps1](RemoteAdministration/Enable-WinRM-Remotely.ps1)   | Enable PowerShell remoting remotely using WMI/CIM.                   |
| [Get-RemoteProcesses.ps1](RemoteAdministration/Get-RemoteProcesses.ps1)       | Retrieve running processes from remote computers.                    |
| [Stop-RemoteProcess.ps1](RemoteAdministration/Stop-RemoteProcess.ps1)         | Terminate processes remotely using RPC or PowerShell Remoting.       |
| [Get-RemoteSerialNumber.ps1](RemoteAdministration/Get-RemoteSerialNumber.ps1) | Retrieve BIOS serial numbers from remote computers.                  |
| [Query-LoggedOnUser.ps1](RemoteAdministration/Query-LoggedOnUser.ps1)         | Determine whether a user is currently logged onto a remote computer. |

---

## Reporting

Scripts for generating reports and analyzing application data.

| Script                                                                             | Description                                                               |
| ---------------------------------------------------------------------------------- | ------------------------------------------------------------------------- |
| [Get-EnvisionWareCheckoutCounts.ps1](Reporting/Get-EnvisionWareCheckoutCounts.ps1) | Generate transaction counts from EnvisionWare OneStop self-checkout logs. |

---

## Windows Administration

General Windows administration utilities.

| Script                                                             | Description                                                 |
| ------------------------------------------------------------------ | ----------------------------------------------------------- |
| [Manage-WindowsServices.ps1](Windows/Manage-WindowsServices.ps1)   | View, stop, and modify Windows services.                    |
| [Show-MessageBox.ps1](Windows/Show-MessageBox.ps1)                 | Display Windows message boxes using PowerShell.             |
| [Reset-PowerShellSession.ps1](Windows/Reset-PowerShellSession.ps1) | Clear variables, modules, and errors during script testing. |

---

# Requirements

Some scripts require additional modules or permissions.

## PowerShell

* Windows PowerShell 5.1 or newer

## Required Modules

Active Directory scripts:

```powershell
Import-Module ActiveDirectory
```

Exchange Online scripts:

```powershell
Install-Module ExchangeOnlineManagement
```

SharePoint Online scripts:

```powershell
Install-Module PnP.PowerShell
```

## Permissions

Depending on the script, required permissions may include:

* Active Directory read permissions
* Exchange Online administrative permissions
* SharePoint Online permissions
* Local administrator permissions
* Remote WMI/CIM access
* SMB access to administrative shares
* WinRM configuration

---

# Technologies Demonstrated

* PowerShell
* Active Directory
* RSAT
* Microsoft 365
* Exchange Online
* SharePoint Online
* WinRM
* WMI / CIM
* RPC
* SMB
* Windows Services
* Remote Administration
* Log Parsing
* CSV Reporting
* Endpoint Automation

---

# Security Notice

All scripts have been sanitized before publication.

The following information has been replaced with generic examples:

* Domain names
* Organizational Units
* Tenant URLs
* Hostnames
* Computer names
* IP addresses
* Usernames
* Email addresses
* Printer names
* Organization-specific identifiers

Always review and test scripts before using them in a production environment.

---

# License

This repository is provided for educational and administrative reference purposes.

Use these scripts at your own risk and test thoroughly before deploying in production environments.
