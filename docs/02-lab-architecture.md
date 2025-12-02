# 02 — Lab Architecture

This document describes the logical and physical layout of the Cisco FTD + FMC lab.

The design is intentionally simple but aligned with how Firepower is typically deployed in production.

---

## High-Level Topology

```text
                Internet / Upstream
                        |
                        v
              +----------------------+
              |   FTD Outside (WAN)  |
              +----------+-----------+
                         |
                    +----+----+
                    |   FTD   |
                    | Firewall|
                    +----+----+
                         |
              +----------+-----------+
              |   FTD Inside (LAN)   |
              +----------+-----------+
                         |
                    Test Client
                         |
                (User / Server VM)

              +----------------------+
              |         FMC          |
              | Central Management   |
              +----------------------+

## Roles of Each Component

### **Firepower Threat Defense (FTD)**

- Acts as the core firewall  
- Separates **inside** and **outside** networks  
- Enforces **Access Control Policies (ACP)**  
- Performs NAT (PAT and static when needed)  
- Sends all logs, events, and telemetry to FMC  

---

### **Firepower Management Center (FMC)**

- Central management and visibility platform  
- Stores all security policies and objects  
- Pushes configurations to FTD  
- Provides dashboards and event views for:  
  - Connections  
  - Intrusions (IPS)  
  - File/Malware  
  - URL filtering  
- Performs centralized logging and reporting  

---

### **Test Client**

Located on the **inside** network.

Used for generating test traffic such as:

- HTTP / HTTPS  
- DNS  
- ICMP  
- Curl requests  

Used to validate:

- NAT  
- Access Control Policy matches  
- IPS alerts  
- URL filtering  
- Logging visibility in FMC  

---

## Networks and Interfaces (Example)

You can change the IPs to match your environment.

**Inside (LAN):** `10.0.10.0/24`  
- FTD Inside: `10.0.10.1`  
- Test client: `10.0.10.100`  

**Outside (WAN):** `192.168.100.0/24`  
- FTD Outside: `192.168.100.10`  
- Upstream gatewa
