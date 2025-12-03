# 11 — How to Reproduce This Lab

This document explains how to rebuild the entire Cisco FTD + FMC Enterprise Security Lab from scratch.  
It is designed to be simple, clear, and fully reproducible for anyone following along.

---

# 🧱 1. Requirements

### Hardware / Virtualization
You may use any virtualization platform:

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

| Component  | vCPU | RAM      | Storage |
|------------|------|----------|---------|
| FMC        | 4    | 8–16 GB  | 100 GB  |
| FTD        | 2–4  | 8 GB     | 20–40 GB |
| Client VM  | 1–2  | 2 GB     | 10 GB    |

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
- Dedicated management switch  
- FMC server  
- Test client on inside LAN  

Refer to the IP schema in:

docs/02-lab-architecture.md

yaml
Copy code

---

# 🔧 3. Deploy and Configure FTD Firewalls

Use the provided Day 0 configuration files:

configs/ftd-day0-config-example.txt
configs/ftd-hq-01-bootstrap.json
configs/ftd-hq-02-bootstrap.json

markdown
Copy code

### Steps:

1. Deploy the FTD image  
2. Apply the bootstrap JSON on first boot (if supported)  
3. Otherwise, manually configure the management IP  
4. Verify DNS and NTP  
5. Confirm FTD can ping FMC  
6. Add FMC as a manager:

```bash
configure manager add <FMC-IP> <REG-KEY>
🧠 4. Deploy and Configure FMC
Follow:

arduino
Copy code
docs/04-fmc-setup-and-registration.md
Steps:
Deploy FMC image

Complete the setup wizard

Configure DNS + NTP

Apply updates (recommended)

Create an FMC registration key

Add the FTD device

Confirm FTD shows a green/healthy status

🧱 5. Build Security Policies
Follow:

pgsql
Copy code
docs/05-access-control-policy.md
Create and deploy:

Access Control Policy (ACP) rules

IPS policy

URL filtering policy

Logging settings

🛰 6. Configure NAT Rules
Follow:

pgsql
Copy code
docs/06-nat-configuration.md
Set up:

Dynamic PAT (inside → outside)

Static NAT (optional)

Identity NAT (optional)

Validate NAT matches in FMC

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

Analysis → Connections

Analysis → Intrusion

Analysis → Malware

Analysis → URL

Analysis → NAT

🧯 8. Troubleshoot if Needed
Use:

Copy code
docs/08-troubleshooting.md
Validate:

FMC registration status

NAT rule order

ACP rule matches

IPS inspection

Packet captures for inside/outside traffic

🎉 Complete
By following these steps, you will have a fully reproduced Cisco FTD + FMC Enterprise Security Lab with:

Centralized management

Access Control Policies

NAT and routing

IPS, URL filtering, and malware analysis

Full visibility in FMC

Real test traffic simulation

This ensures a clean, repeatable deployment for learning and demonstration.

yaml
Copy code

---