<#
.SYNOPSIS
    This PowerShell script disables Microsoft consumer experiences.

.NOTES
    Author          : Anthony De Leon
    STIG-ID         : WN11-CC-000197
#>

$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
$valueName = "DisableConsumerFeatures"
$valueData = 1

if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

New-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -PropertyType DWord -Force | Out-Null

Write-Host "Consumer features disabled."
