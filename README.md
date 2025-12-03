# Cisco FTD + FMC Enterprise Security Lab

This project walks through building a full **Cisco Firepower Threat Defense (FTD)** firewall and managing it using **Firepower Management Center (FMC)**—just like in enterprise environments.

The goal of this lab is to demonstrate essential firewall engineering skills:

- FMC centralized management
- Access Control Policies (ACP)
- NAT (Dynamic, PAT, Static)
- Intrusion Prevention (IPS)
- URL & File/Malware inspection
- Traffic visibility and event analysis
- Realistic troubleshooting workflows

This repository is structured to be clear, professional, and easy to follow.

---

# 📌 Table of Contents

- [Overview](#overview)
- [Lab Architecture](#lab-architecture)
- [Documentation](#documentation)
- [Configurations](#configurations)
- [Testing Tools](#testing-tools)
- [Skills Demonstrated](#skills-demonstrated)
- [Future Enhancements](#future-enhancements)

---

# 🧱 Overview

Cisco FTD combines:

- Stateful firewalling  
- Intrusion Prevention (Snort)  
- Application control  
- URL filtering  
- Malware/file analysis  
- VPN  
- NAT  

FMC is the centralized platform where all policies, logging, and management occur.

This lab replicates a real-world environment on a manageable scale.

---

# 🧩 Lab Architecture

            Internet
                |
                v
      +----------------------+
      |      Outside         |
      |      (FTD WAN)       |
      +----------+-----------+
                 |
            +----+----+
            |   FTD   |
            | Firewall|
            +----+----+
                 |
      +----------+-----------+
      |        Inside        |
      | (Users / Servers)    |
      +----------+-----------+
                 |
            Test Client
                 |
       (Traffic → FTD → FMC)

      +----------------------+
      |        FMC           |
      |   Central Mgmt       |
      +----------------------+

Below is the full enterprise-style topology used in this Firepower lab:

![FTD-FMC Topology](diagrams/ftd-fmc-topology.png)

**Figure 1 — Cisco FTD + FMC enterprise lab topology**
---

## 📦 Exported Lab Files

To make this lab fully reproducible and transparent, several exports from FMC and CML are included in the repository.

### 🔹 FMC Policy Export  
The following package contains the exported configuration from FMC, including:

- Access Control Policy (ACP)
- NAT policy
- Intrusion (IPS) policy
- Platform settings (logging, syslog, etc.)
- Alert configurations

You can find it here:

- [`exports/FMC-Policy-Export.sfo`](exports/FMC-Policy-Export.sfo)

This file can be imported directly into FMC using:
System → Tools → Import/Export → Upload Package


It will recreate your ACP, IPS, NAT, platform settings, and alerting exactly as configured in the lab.

---

### 🔹 CML Topology Export  
The full network topology used in this lab is available as a Cisco Modeling Labs (CML) YAML file:

- [`exports/FTD-FMC-lab-cml-topology.yaml`](exports/FTD-FMC-lab-cml-topology.yaml)

This file can be imported directly into Cisco Modeling Labs to reproduce the:

- ISP paths  
- Edge routers  
- FTD firewalls (HQ-01, HQ-02)  
- Management switch  
- FMC server  
- Inside LAN + test client  

Import using:
CML → File → Import → Select YAML File

This creates a fully functional copy of the network for testing, learning, or extending the lab.

---

## 🧩 Why These Exports Matter

Including exported files makes the repo:

- **Reproducible** — anyone can recreate your exact environment  
- **Auditable** — reviewers can see the actual production configuration  
- **Professional** — mirrors real-world change control documentation  
- **Extensible** — future lab upgrades (VPN, SSL decryption, HA) can easily reuse the same base topology  

These exports complete the end-to-end documentation for the Firepower Enterprise Lab.

---

# 📚 Documentation

All major configuration sections are organized inside the `/docs` folder:

- `01-overview.md`
- `02-lab-architecture.md`
- `03-ftd-day0-setup.md`
- `04-fmc-setup-and-registration.md`
- `05-access-control-policy.md`
- `06-nat-configuration.md`
- `07-testing-and-event-analysis.md`
- `08-troubleshooting.md`

Each file explains a different stage of the build.

---

# 🛠 Configurations

Inside `/configs` you’ll find:

- FTD Day-0 setup  
- Registration key examples  
- NAT rule examples  
- ACP examples  
- Optional VPN configs  

(Sanitized for security.)

---

# 🧪 Testing Tools

Inside `/scripts` you will find:

- Traffic generation  
- Connection tests  
- URL category tests  
- Intrusion triggering tests  

These help verify policies and logs inside FMC.

---

# 🧠 Skills Demonstrated

This project highlights practical skills including:

### Network Security  
- Firewall concepts  
- NAT types  
- IPS & URL filtering  
- Malware/File inspection  
- Log interpretation  

### Cisco Firepower Platform  
- FMC management  
- FTD onboarding  
- Access Control Policy design  
- Deployment workflows  

### Professional Documentation  
- Clear repo structure  
- Step-by-step guides  
- Architecture diagrams  
- Config examples  

---

# 🚀 Future Enhancements

Planned updates include:

- AnyConnect VPN  
- Identity-based rules  
- SSL decryption  
- Threat Intelligence feeds  
- SIEM integration (Security Onion / Wazuh)  
- Multi-site topology with branch FTDs  

This lab reflects practical skills in deploying and managing Cisco Firepower in an enterprise-style environment.
---
