<#
.SYNOPSIS
    This PowerShell script configures the legal notice displayed before logon.

.NOTES
    Author          : Anthony De Leon
    LinkedIn        : linkedin.com/in/anthonydeleon5/
    GitHub          : github.com/anthonydeleon5
    Date Created    : 2026-04-06
    Last Modified   : 2026-04-06
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000110

.TESTED ON
    Date(s) Tested  : 2026-04-06
    Tested By       : Anthony De Leon
    Systems Tested  : Windows 11
    PowerShell Ver. : 5.1+

.USAGE
    Run with administrative privileges.
    PS C:\> .\WN11-SO-000075_remediation.ps1
#>

$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"

if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

Set-ItemProperty -Path $registryPath -Name "LegalNoticeCaption" -Value "Authorized Use Only"
Set-ItemProperty -Path $registryPath -Name "LegalNoticeText" -Value "This system is for authorized use only."

Write-Host "Legal logon banner configured."
