<#
.SYNOPSIS
    This PowerShell script enables auditing for Process Creation success events.

.NOTES
    Author          : Anthony De Leon
    LinkedIn        : linkedin.com/in/anthonydeleon5/
    GitHub          : github.com/anthonydeleon5
    Date Created    : 2026-04-06
    Last Modified   : 2026-04-06
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000050

.TESTED ON
    Date(s) Tested  : 2026-04-06
    Tested By       : Anthony De Leon
    Systems Tested  : Windows 11
    PowerShell Ver. : 5.1+

.USAGE
    Example syntax:
    PS C:\> .\__remediation_template(WN11-AU-000050).ps1 
#>

# Enable auditing for Process Creation (Success)
auditpol /set /subcategory:"Process Creation" /success:enable | Out-Null

Write-Host "Audit policy 'Process Creation (Success)' enabled."
