<#
.SYNOPSIS
    This PowerShell script forces Group Policy to reapply even if unchanged.

.NOTES
    Author          : Anthony De Leon
    LinkedIn        : linkedin.com/in/anthonydeleon5/
    GitHub          : github.com/anthonydeleon5
    Date Created    : 2026-04-06
    Last Modified   : 2026-04-06
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000090

.TESTED ON
    Date(s) Tested  : 2026-04-06
    Tested By       : Anthony De Leon
    Systems Tested  : Windows 11
    PowerShell Ver. : 5.1+

.USAGE
    Example syntax:
    PS C:\> .\__remediation_template(WN11-CC-000090).ps1 
#>

$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}"
$valueName = "NoGPOListChanges"
$valueData = 0

if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

New-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -PropertyType DWord -Force | Out-Null

Write-Host "Registry value '$valueName' set to '$valueData' at '$registryPath'."
