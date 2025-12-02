# 03 — FTD Day 0 Setup

This document covers the initial configuration required to bring a Cisco Firepower Threat Defense (FTD) appliance online and prepare it for FMC registration.

The goal of this phase is to:

- Assign a management IP address  
- Configure DNS and time services  
- Verify network connectivity  
- Enable the system for FMC onboarding  

This is the “first boot” stage of the firewall.

---

## 1. Accessing the FTD Console

Once deployed in your hypervisor:

- Open the VM console  
- Follow the initial setup prompts  
- Set the **admin** password  
- Set the **firepower** CLI password  

These credentials are required for FMC registration.

---

## 2. Configure the Management Interface

Management is configured through the CLI.

Example:

```bash
configure network ipv4 manual 192.168.20.10 255.255.255.0 192.168.20.1

Verify:

show network


Make sure:

IP address is correct

Gateway is reachable

Management interface is up

3. Configure DNS and NTP

Accurate DNS and NTP settings are required for successful registration with FMC.

Configure DNS:
configure network dns servers 1.1.1.1 8.8.8.8

Configure NTP:
configure network ntp servers pool.ntp.org

4. Verify Connectivity

Make sure the FTD can reach FMC and the internet.

ping <FMC-IP>
ping google.com


If DNS fails, fix it before continuing.

5. Prepare for FMC Registration

Add the FMC as a manager:

configure manager add <FMC-IP> <REGISTRATION-KEY>


Verify the manager status:

show managers


Expected output:

FMC IP displayed

Status: Pending (before registration)

Status: Completed (after FMC connects)

6. Check System Health (Optional but Recommended)

Enter diagnostic mode:

system support diagnostic-cli


Inside the diagnostic CLI, check interfaces and routes:

show interface ip brief
show route


These confirm routing and interface setup.

Summary

By the end of Day 0:

Management IP is configured

DNS and NTP are working

Connectivity with FMC is confirmed

Registration key is added

FTD is ready for FMC onboarding
