```markdown
# Access Control Policy (ACP) Example — "Enterprise-ACP"

This file describes the key rules configured in the lab ACP.

---

## Policy Details

- Name: `Enterprise-ACP`
- Base Policy: `Balanced Security and Connectivity`
- Default Action: `Block All Traffic`
- IPS Policy (where applied): `Balanced Security and Connectivity`

---

## Rule 1 — Allow Inside → Outside (Web + General)

- Action: **Allow**
- Source Zone: `INSIDE_ZONE`
- Destination Zone: `OUTSIDE_ZONE`
- Source Network: `10.0.10.0/24`
- Destination Network: `Any`
- Applications: `Any`
- URL Filtering: `Monitor`
- IPS Policy: `Balanced Security and Connectivity`
- Logging: **Log at End of Connection**

---

## Rule 2 — Block High-Risk Applications

- Action: **Block**
- Source Zone: `INSIDE_ZONE`
- Destination Zone: `OUTSIDE_ZONE`
- Applications: High-risk application categories (P2P, TOR, certain proxies)
- URL Category: `Any`
- IPS Policy: (optional) `Connectivity Over Security`
- Logging: **Log at Beginning and End**

---

## Rule 3 — URL Category Blocking (Example)

- Action: **Block**
- Source Zone: `INSIDE_ZONE`
- Destination Zone: `OUTSIDE_ZONE`
- URL Categories:
  - Gambling
  - Adult Content
  - Malware Sites
- Applications: `Any`
- Logging: Enabled

---

## Rule 4 — IPS-Focused Rule (Optional)

- Action: **Allow**
- Source Zone: `INSIDE_ZONE`
- Destination Zone: `OUTSIDE_ZONE`
- Applications: Web Browsing
- IPS Policy: `Security Over Connectivity`
- Logging: Enabled

---

## Default Action

- Action: **Block**
- Logging: Optional (enabled in lab for visibility)
- IPS Policy: `Balanced Security and Connectivity`

This ACP structure demonstrates:

- Explicit allows
- Explicit app/URL-based blocks
- Default deny
- IPS and URL filtering integration
- Logging appropriate for analysis in FMC01

See bootstrap template:
- ftd-hq-01-bootstrap.json
- ftd-hq-02-bootstrap.json
- fmc-hq-bootstrap.json
