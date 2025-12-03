
```markdown
# NAT Configuration Examples (FMC → FTD)

This file captures example NAT rules used in the lab.  
Exact IPs can be adjusted per environment.

---

## 1. Dynamic PAT (Inside → Outside)

**Purpose:** Allow inside clients to reach the internet using the FTD outside interface.

- Type: **Dynamic PAT (Interface PAT)**
- Section: Manual NAT (Section 1)
- Original Source: `10.0.10.0/24`
- Original Destination: `Any`
- Original Service: `Any`
- Translated Source: **Outside Interface**
- Logging: Enabled

---

## 2. Static NAT (Optional Web Server)

**Example:**

- Internal Server: `10.0.10.50`
- Public IP: `192.168.100.50`
- Service: `TCP/443`

NAT rule:

- Original Source: `10.0.10.50`
- Translated Source: `192.168.100.50`
- Destination: `Any`
- Service: `TCP/443`

Reminder:  
A matching ACP rule must exist to allow inbound HTTPS to `10.0.10.50`.

---

## 3. Identity NAT (No NAT Between Specific Networks)

Example when traffic between two internal networks should not be translated:

- Source: `10.0.10.0/24`
- Destination: `10.0.20.0/24`
- Translated Source: **Original**
- Translated Destination: **Original**
- Section: Manual NAT (Section 1, above PAT)

This is commonly used for VPN or DMZ traffic.

---

## 4. Verification Checklist

On the test client:

```bash
curl ifconfig.me
ping 8.8.8.8
curl https://google.com
In FMC:

Analysis → Connections

Analysis → NAT

Confirm:

Original & translated IP addresses

NAT rule name

ACP rule name

Action = ALLOW

See bootstrap template:
- ftd-hq-01-bootstrap.json
- ftd-hq-02-bootstrap.json
- fmc-hq-bootstrap.json
