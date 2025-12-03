```markdown
# 11 — How to Reproduce This Lab

This document explains how to rebuild the entire Cisco FTD + FMC Enterprise Security Lab from scratch.  
It is designed to be simple, clear, and reproducible for anyone following along.

---

# 🧱 1. Requirements

### Hardware / Virtualization
Any virtualization platform works:
- Proxmox  
- VMware Workstation / ESXi  
- EVE-NG  
- Cisco Modeling Labs (CML)  
- VirtualBox (FTD not officially supported)

### Files Needed
- Cisco FTDv image  
- Cisco FMCv image  
- Ubuntu ISO (for test client)

### Minimum Resources
| Component | vCPU | RAM | Storage |
|----------|------|-----|---------|
| FMC      | 4    | 8–16 GB | 100 GB |
| FTD      | 2–4  | 8 GB | 20–40 GB |
| Client VM | 1–2 | 2 GB | 10 GB |

---

# 🌐 2. Import the Topology

Use the provided diagram to build your topology:

diagrams/ftd-fmc-topology.png

diff
Copy code

Recommended layout:
- Two ISP paths  
- Two edge routers  
- Two FTD firewalls  
- Management switch  
- FMC server  
- Test client LAN  

Base your network on the IP schema shown in:
docs/02-lab-architecture.md

yaml
Copy code

---

# 🔧 3. Deploy and Configure FTD Firewalls

Use the provided Day-0 config examples:

configs/ftd-day0-config-example.txt
configs/ftd-hq-01-bootstrap.json
configs/ftd-hq-02-bootstrap.json

markdown
Copy code

Steps:

1. Deploy FTD image
2. Apply bootstrap on first boot (if supported by your platform)
3. Set management IP manually if needed
4. Verify DNS + NTP
5. Ping FMC
6. Add manager:

```bash
configure manager add <FMC-IP> <REG-KEY>
🧠 4. Deploy and Configure FMC
Follow:

arduino
Copy code
docs/04-fmc-setup-and-registration.md
Steps:

Deploy FMC image

Complete setup wizard

Configure DNS + NTP

Create registration key

Add device

Confirm green health status

🧱 5. Build Security Policies
Follow:

pgsql
Copy code
docs/05-access-control-policy.md
Create and deploy:

ACP rules

IPS policy

URL filtering

Logging options

🛰 6. Configure NAT Rules
Follow:

pgsql
Copy code
docs/06-nat-configuration.md
Set up:

Dynamic PAT

Static NAT (optional)

Identity NAT (optional)

NAT verification

🧪 7. Test the Environment
Follow:

csharp
Copy code
docs/07-testing-and-event-analysis.md
From the test VM:

bash
Copy code
curl ifconfig.me
curl https://google.com
ping 8.8.8.8
nslookup cisco.com
Check logs in FMC:

Connections

Intrusions

Malware

URL filtering

NAT

🧯 8. Troubleshoot if Needed
Use:

Copy code
docs/08-troubleshooting.md
Check:

FMC registration

NAT rule order

ACP logging

IPS inspection

Packet captures