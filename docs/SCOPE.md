# Project Scope & MVP Definition

This document outlines the operational boundaries, environment prerequisites, and selected detection coverage for the initial Minimum Viable Product (MVP).

---

## 1. MVP Overview

The objective of this MVP is to establish a functional Purple Team baseline by validating detection engineering workflows against adversary behaviors mapped to the MITRE ATT&CK framework.

* **Target Sector:** Healthcare (simulating threat actors targeting clinical and enterprise health infrastructure)
* **Execution Environment:** 1 Dedicated Windows Virtual Machine (Windows 10/11 or Windows Server)
* **Initial Detection Scope:** 15 MITRE ATT&CK Techniques

---

## 2. In-Scope MITRE ATT&CK Techniques

The following 15 techniques represent the initial testing surface for log collection, detection logic, and verification:

| # | Technique ID | Technique Name | Primary Tactic |
|---|---|---|---|
| 01 | `T1059.001` | PowerShell | Execution |
| 02 | `T1053.005` | Scheduled Task | Execution, Persistence, Privilege Escalation |
| 03 | `T1547.001` | Registry Run Keys / Startup Folder | Persistence, Privilege Escalation |
| 04 | `T1136.001` | Local Account Creation | Persistence |
| 05 | `T1003.001` | LSASS Memory Dumping | Credential Access |
| 06 | `T1105` | Ingress Tool Transfer | Command and Control |
| 07 | `T1046` | Network Service Discovery | Discovery |
| 08 | `T1021.002` | SMB/Windows Admin Shares | Lateral Movement |
| 09 | `T1070.001` | Clear Windows Event Logs | Defense Evasion |
| 10 | `T1562.001` | Disable or Modify Tools (Security Software) | Defense Evasion |
| 11 | `T1218.011` | Rundll32 | Defense Evasion |
| 12 | `T1055.001` | Dynamic-link Library (DLL) Injection | Defense Evasion, Privilege Escalation |
| 13 | `T1110.001` | Password Guessing | Credential Access |
| 14 | `T1082` | System Information Discovery | Discovery |
| 15 | `T1057` | Process Discovery | Discovery |

---

## 3. Environment & Tooling Specifications

* **Operating System:** Windows Client/Server VM
* **Telemetry Generation:**
  * Windows Event Logs (Security, System, TaskScheduler)
  * Sysmon (configured with baseline modular rules)
  * PowerShell Auditing (Script Block Logging & Module Logging enabled)
* **Execution Framework:** Manual adversary emulation scripts alongside automated execution harnesses.

---

## 4. Phase 2 Roadmap & Finalization

* **Atomic Red Team Alignment:** During Phase 2, each listed technique will be cross-referenced with pre-defined tests from the [Atomic Red Team](https://github.com/redcanaryco/atomic-red-team) library.
* **Test Validation & Coverage:** Any technique without an executable test profile or observable telemetry artifact will be calibrated or swapped.
* **Scope Lock:** Following atomic testing alignment and telemetry validation, the finalized attack matrix and detection rules will be locked for regression testing and reporting.