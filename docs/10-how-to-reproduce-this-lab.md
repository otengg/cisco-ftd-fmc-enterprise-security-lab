11 — How to Reproduce This Lab

This document explains how to rebuild the entire Cisco FTD + FMC Enterprise Security Lab from scratch.
It is designed to be simple, clear, and fully reproducible for anyone following along.

🧱 1. Requirements
Hardware / Virtualization

You may use any virtualization platform:

Proxmox

VMware Workstation / ESXi

EVE-NG

Cisco Modeling Labs (CML)

VirtualBox (FTD not officially supported)

Files Needed

Cisco FTDv image

Cisco FMCv image

Ubuntu ISO (for test client)

Minimum Resources
Component	vCPU	RAM	Storage
FMC	4	8–16 GB	100 GB
FTD	2–4	8 GB	20–40 GB
Client VM	1–2	2 GB	10 GB
🌐 2. Import the Topology

Use the provided topology diagram:

diagrams/ftd-fmc-topology.png

Recommended layout:

Two ISP paths

Two edge routers

Two FTD firewalls

Dedicated management switch

FMC server

Test client on inside LAN

Refer to the IP layout in:

docs/02-lab-architecture.md

🔧 3. Deploy and Configure FTD Firewalls

Use the provided Day 0 configuration files:

configs/ftd-day0-config-example.txt
configs/ftd-hq-01-bootstrap.json
configs/ftd-hq-02-bootstrap.json

Steps:

Deploy the FTD image

Apply the bootstrap JSON on first boot (if supported)

Otherwise, manually configure the management IP

Verify DNS and NTP

Confirm FTD can ping FMC

Add FMC as a manager:

configure manager add <FMC-IP> <REG-KEY>

🧠 4. Deploy and Configure FMC

Follow:

docs/04-fmc-setup-and-registration.md

Steps:

Deploy FMC image

Complete setup wizard

Configure DNS + NTP

Apply updates (recommended)

Create a registration key

Add the FTD device

Confirm device health is green

🧱 5. Build Security Policies

Follow:

docs/05-access-control-policy.md

Create and deploy:

Access Control Policy (ACP)

IPS policy

URL filtering policy

Logging settings

🛰 6. Configure NAT Rules

Follow:

docs/06-nat-configuration.md

Set up:

Dynamic PAT

Static NAT (optional)

Identity NAT (optional)

Validate NAT translations in FMC

🧪 7. Test the Environment

Follow:

docs/07-testing-and-event-analysis.md

From the test VM:

curl ifconfig.me
curl https://google.com
ping 8.8.8.8
nslookup cisco.com


Check logs in FMC:

Connections

Intrusions

Malware

URL filtering

NAT events

🧯 8. Troubleshoot if Needed

Follow:

docs/08-troubleshooting.md

Validate:

FMC registration

NAT rule order

ACP rule matches

IPS inspection

Packet captures (inside/outside)

🎉 Complete

At this point, you have successfully reproduced the entire Cisco FTD + FMC Enterprise Security Lab with:

Centralized FMC management

ACP and IPS enforcement

NAT + routing

URL filtering & file inspection

Full event visibility

Functional test traffic

This ensures a clean, repeatable enterprise-style deployment.