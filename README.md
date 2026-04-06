# Windows 11 Security Hardening: Automated STIG Compliance Project

## Project Overview
This project focuses on the systematic hardening of Windows 11 environments by automating the remediation of security vulnerabilities identified by the **Defense Information Systems Agency (DISA)**. Using a combination of enterprise-grade scanning tools and custom automation scripts, I addressed critical compliance gaps to ensure the infrastructure meets federal security standards.

---

## Technical Specifications

### Platform
* **Windows 11 Virtual Machines (Microsoft Azure)**: Used as the primary environment for hosting the target operating systems and performing security audits.

### Tools Used
* **Tenable**: Leveraged for comprehensive vulnerability management, compliance auditing, and post-remediation verification.
* **Windows PowerShell**: The primary engine used to develop and execute automation scripts for system hardening.

---

## The Challenge: Compliance Gaps
Following a routine internal security audit, multiple Windows 11 assets were flagged for non-compliance with the **DISA Security Technical Implementation Guides (STIGs)**. To minimize manual overhead and human error, I developed a repeatable, automated framework to remediate these vulnerabilities and verify the security posture of the network.

## Operational Workflow

### 1. Identification and Baselining
The process began with a comprehensive vulnerability scan using Tenable. By utilizing the "Windows Compliance Checks", I established a baseline of all current failures relative to the **DISA Microsoft Windows 11 STIG v2r4** audit file.

> 

### 2. Vulnerability Research
For every identified failure, I cross-referenced the unique **STIG-ID** within the Tenable Audit database. This step was crucial to understanding the technical requirements (Registry keys, Group Policy settings, or Services) needed for a successful fix.

### 3. Development of Remediation Scripts
Using a standardized PowerShell template, I developed modular scripts to apply the necessary security configurations. Each script was designed to target specific Registry hives or system policies, provide verbose logging, and ensure changes persisted across reboots.

### 4. Execution and Validation
Scripts were tested and executed within a controlled PowerShell environment. Validation followed a two-tier approach:
1.  **Manual Verification:** Manually checking the **Registry Editor** to ensure DWORD values or String paths were correctly modified.
2.  **Automated Verification:** A follow-up Tenable scan was performed to confirm that the specific STIG-ID no longer appeared as a "Fail."

---

## Implemented STIG Remediations
Below are the 10 automated remediation modules developed for this project:

1.  **Remediation 1:** [stig-security-1]
2.  **Remediation 2:** [stig-security-2]
3.  **Remediation 3:** [stig-security-3]
4.  **Remediation 4:** [stig-security-4]
5.  **Remediation 5:** [stig-security-5]
6.  **Remediation 6:** [stig-security-6]
7.  **Remediation 7:** [stig-security-7]
8.  **Remediation 8:** [stig-security-8]
9.  **Remediation 9:** [stig-security-9]
10. **Remediation 10:** [stig-security-10]

---

## Summary and Results
By leveraging **PowerShell automation**, the time required to harden these systems was reduced significantly compared to manual configuration. After applying the fixes and restarting the target machines, a final audit was conducted to verify the results.

**Key Achievements:**
* Successfully transitioned all targeted STIG-IDs from a "Failed" to "Passed" status.
* Created a library of reusable PowerShell scripts for future compliance drift.
* Validated all changes through both the Windows Registry and Tenable's scanning engine.

> 

## Final Reporting
Upon successful validation, the completed scripts and a comprehensive remediation report were submitted to the **InfoSec / SecOps** departments for final review and production deployment.
