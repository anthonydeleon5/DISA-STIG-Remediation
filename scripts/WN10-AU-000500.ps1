<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

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
    Example syntax:
    PS C:\> .\__remediation_template(WN10-AU-000500).ps1 
#>

# Define the registry path and value
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$valueName = "MaxSize"
$valueData = 32768  # 0x00008000 in decimal

# Check if the registry path exists, if not create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the MaxSize value
New-ItemProperty -Path $registryPath `
    -Name $valueName `
    -Value $valueData `
    -PropertyType DWord `
    -Force | Out-Null

# Output success message
Write-Host "Registry value '$valueName' set to '$valueData' at '$registryPath'."
