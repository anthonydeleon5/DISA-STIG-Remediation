<#
.SYNOPSIS
    This PowerShell script enables auditing for Other Logon/Logoff Events success.

.NOTES
    Author          : Anthony De Leon
    LinkedIn        : linkedin.com/in/anthonydeleon5/
    GitHub          : github.com/anthonydeleon5
    Date Created    : 2026-04-06
    Last Modified   : 2026-04-06
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000560

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run with administrative privileges.
    PS C:\> .\WN11-AU-000560_remediation.ps1
#>

auditpol /set /subcategory:"Other Logon/Logoff Events" /success:enable

Write-Host "Audit policy 'Other Logon/Logoff Events (Success)' enabled."
