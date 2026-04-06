# Windows 11 Security Hardening: Automated STIG Compliance Project

## Project Overview
This project focuses on the systematic hardening of Windows 11 environments by automating the remediation of security vulnerabilities identified by the Defense Information Systems Agency (DISA). Using a combination of enterprise-grade scanning tools and custom automation scripts, I addressed critical compliance gaps to ensure the infrastructure meets federal security standards.

## Technical Specifications
* **Platform:** Windows 11 Virtual Machines (Microsoft Azure) - Used as the primary environment for hosting the target operating systems and performing security audits.
* **Tools Used:** * **Tenable / Nessus:** Leveraged for comprehensive vulnerability management, compliance auditing, and post-remediation verification.
  * **Windows PowerShell:** The primary engine used to develop and execute automation scripts for system hardening.

## The Challenge: Compliance Gaps
Following a routine internal security audit, multiple Windows 11 assets were flagged for non-compliance with the DISA Security Technical Implementation Guides (STIGs). To minimize manual overhead and human error, I developed a repeatable, automated framework to remediate these vulnerabilities and verify the security posture of the network.

## Operational Workflow

### 1. Identification and Baselining
The process began with a comprehensive vulnerability scan using Tenable. By utilizing the "Windows Compliance Checks", I established a baseline of all current failures relative to the DISA Microsoft Windows 11 STIG v2r4 audit file.

![Initial Tenable Scan - Failed STIGs](images/Failed-WIN11-AU-000500.png)
*(Above: Initial vulnerability scan highlighting non-compliant system configurations.)*

### 2. Vulnerability Research
For every identified failure, I cross-referenced the unique STIG-ID within the Tenable Audit database. This step was crucial to understanding the technical requirements (Registry keys, Group Policy settings, or Services) needed for a successful fix.

### 3. Development of Remediation Scripts
Using a standardized PowerShell template, I developed modular scripts to apply the necessary security configurations. Each script was designed to target specific Registry hives or system policies, provide verbose logging, and ensure changes persisted across reboots.

### 4. Execution and Validation
Scripts were tested and executed within a controlled PowerShell environment. Validation followed a two-tier approach:
* **Manual Verification:** Manually checking the Registry Editor (`regedit`) and Local Security Policy (`secpol.msc`) to ensure values were correctly modified.
* **Automated Verification:** A follow-up Tenable scan was performed to confirm that the specific STIG-IDs no longer appeared as a "Fail."

---

## Implemented STIG Remediations
Below are the 10 automated remediation modules developed for this project. *Click on the script name to view the source code.*

1. **[WN10-AU-000500.ps1](scripts/WN10-AU-000500.ps1)** * **Fix:** Configured the maximum size of the Windows Application event log to at least 32,768 KB to prevent audit data loss.
2. **[WN11-AU-000050.ps1](scripts/WN11-AU-000050.ps1)**
   * **Fix:** Enabled success auditing for "Process Creation" to establish a forensic trail of executed applications.
3. **[WN11-AU-000560.ps1](scripts/WN11-AU-000560.ps1)**
   * **Fix:** Enabled success auditing for "Other Logon/Logoff Events" to track background authentication activities.
4. **[WN11-AU-000584.ps1](scripts/WN11-AU-000584.ps1)**
   * **Fix:** Enabled success auditing for "Handle Manipulation" to track resource access by user processes.
5. **[WN11-CC-000090.ps1](scripts/WN11-CC-000090.ps1)**
   * **Fix:** Forced Group Policy security settings to reprocess even if they haven't changed, preventing local policy drift.
6. **[WN11-CC-000110.ps1](scripts/WN11-CC-000110.ps1)**
   * **Fix:** Disabled HTTP Printing via the registry to mitigate print spooler network vulnerabilities.
7. **[WN11-CC-000197.ps1](scripts/WN11-CC-000197.ps1)**
   * **Fix:** Disabled Microsoft Consumer Experiences to prevent unauthorized third-party application downloads.
8. **[WN11-CC-000285.ps1](scripts/WN11-CC-000285.ps1)**
   * **Fix:** Enforced secure RPC communication for Remote Desktop connections to ensure encrypted traffic.
9. **[WN11-CC-000315.ps1](scripts/WN11-CC-000315.ps1)**
   * **Fix:** Disabled the `AlwaysInstallElevated` feature to prevent standard users from running MSI installers with SYSTEM privileges.
10. **[WN11-SO-000075.ps1](scripts/WN11-SO-000075.ps1)**
    * **Fix:** Configured the legal notice banner to display authorized use warnings prior to system logon.

---

## Summary and Results
By leveraging PowerShell automation, the time required to harden these systems was reduced significantly compared to manual configuration. After applying the fixes and restarting the target machines, a final audit was conducted to verify the results.

![Final Tenable Scan - Passed STIGs](images/PASSED-WN11-AU-000500.png)
*(Above: Follow-up vulnerability scan confirming successful STIG remediation.)*

**Key Achievements:**
* Successfully transitioned all targeted STIG-IDs from a "Failed" to "Passed" status.
* Created a library of reusable PowerShell scripts to combat future compliance drift.
* Validated all changes through both native Windows tools and Tenable's scanning engine.

## Final Reporting
Upon successful validation, the completed scripts and a comprehensive remediation report were submitted to the InfoSec / SecOps departments for final review and production deployment.
