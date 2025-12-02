# 06 — NAT Configuration (Dynamic PAT, Static NAT, Identity NAT)

This document explains how to configure NAT on Cisco FTD using FMC.  
NAT is required for inside hosts to reach external networks, and it plays an important role in how traffic is evaluated by Access Control Policies.

We will configure:

- Dynamic PAT (Inside → Outside)  
- Optional Static NAT (for published services)  
- Identity NAT (when NAT should *not* occur)  
- NAT verification using FMC event logs  

---

## 1. NAT Overview in FMC

In FMC, NAT is divided into three main sections:

1. **Auto NAT (Object NAT)**  
   - Simple NAT inside network objects  
   - Useful for small, straightforward rules

2. **Manual NAT**  
   - More flexible  
   - Evaluated before Auto NAT  
   - Recommended for enterprise-style labs

3. **Identity NAT**  
   - Used when you need *no NAT*  
   - Often used for site-to-site VPNs or DMZ access

For this lab, **Manual NAT** is the correct choice.

Navigate to:

Devices → NAT

yaml
Copy code

---

## 2. Dynamic PAT (Inside → Outside)

This is the most common NAT rule.  
It allows inside hosts to share the FTD’s outside IP when accessing the internet.

### Create the PAT Rule

In FMC:

1. Go to:
Devices → NAT → Add Rule

yaml
Copy code
2. Configure:
- **Type:** Dynamic PAT (PAT Pool or Interface PAT)
- **Original Source:** Inside network (e.g., 10.0.10.0/24)
- **Translated Source:** Outside interface (Interface PAT)
- **Original Destination:** Any
- **Original Service:** Any
3. Enable Logging.

Your test client should now NAT to the firewall's outside IP.

---

## 3. Static NAT (Optional)

Use Static NAT if you want to expose an internal service (e.g., web server) to the outside.

Example:

- Internal server: `10.0.10.50`
- Outside IP: `192.168.100.50`

Create a rule:

- **Original Source:** 10.0.10.50  
- **Translated Source:** 192.168.100.50  
- **Destination:** Any  
- **Service:** TCP/80 or TCP/443  

⚠️ **Remember:**  
Static NAT requires a matching Access Control Policy rule to allow inbound traffic.

---

## 4. Identity NAT (Optional)

Identity NAT is used when traffic should *not* be translated.

Typical uses:

- VPN networks  
- Inside-to-inside traffic  
- DMZ access scenarios  

Example Identity NAT rule:

- **Original Source:** 10.0.10.0/24  
- **Translated Source:** Original  
- **Destination:** 10.0.20.0/24  
- **Translated Destination:** Original  

Identity NAT ensures packets keep their original IPs.

---

## 5. NAT Rule Order

NAT rules are evaluated in this order:

1. **Manual NAT (Section 1)**  
2. **Auto NAT (Object NAT)**  
3. **Manual NAT (Section 2)**  

Important notes:

- Put PAT rules in Manual NAT Section 1  
- Put Static NAT rules above PAT in Section 1  
- Identity NAT should be placed **first** if needed  

Order matters.

---

## 6. Verify NAT is Working

### On the test client:

Check your translated IP:

```bash
curl ifconfig.me
Ping external hosts:

bash
Copy code
ping 8.8.8.8
Browse websites or run:

bash
Copy code
curl https://google.com
In FMC:
Go to:

nginx
Copy code
Analysis → Connections
Analysis → NAT
You will see:

Original IP

Translated IP

Hit NAT rule

Action taken

ACP rule matched

This confirms NAT is occurring as expected.

Summary
At this point, NAT should be fully operational:

Inside hosts NAT to the outside interface

Optional static NAT rules are in place

Identity NAT (if used) prevents translation

FMC shows NAT logs and translation events