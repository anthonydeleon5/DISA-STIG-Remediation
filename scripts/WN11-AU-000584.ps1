<#
.SYNOPSIS
    This PowerShell script enables auditing for Handle Manipulation success events.

.NOTES
    Author          : Anthony De Leon
    LinkedIn        : linkedin.com/in/anthonydeleon5/
    GitHub          : github.com/anthonydeleon5
    Date Created    : 2026-04-06
    Last Modified   : 2026-04-06
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000584

.TESTED ON
    Date(s) Tested  : 2026-04-06
    Tested By       : Anthony De Leon
    Systems Tested  : Windows 11
    PowerShell Ver. : 5.1+

.USAGE
    Run with administrative privileges.
    PS C:\> .\WN11-AU-000584_remediation.ps1
#>

auditpol /set /subcategory:"Handle Manipulation" /success:enable

Write-Host "Audit policy 'Handle Manipulation (Success)' enabled."
