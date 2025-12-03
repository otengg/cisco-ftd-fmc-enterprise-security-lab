# FMC Registration Notes (FTD Onboarding)

These notes summarize the key parameters used when registering the FTD firewall to FMC.

---

## FTD → FMC (CLI)

On the FTD:

```bash
configure manager add <FMC-IP> <REGISTRATION-KEY>
show managers


Key items:

<FMC-IP> = FMC management IP

<REGISTRATION-KEY> = shared secret used only for this device

FMC → FTD (UI)

In FMC:

Navigate to:

Devices → Device Management → Add → Add Device


Enter:

Management IP: <FTD-MGMT-IP>

Registration Key: <REGISTRATION-KEY> (must match FTD)

Display Name: FTD-HQ-01

Assign Access Control Policy:

Enterprise-ACP

Post-Registration Checks

FTD appears in Devices → Device Management with a green status icon

Deployment succeeds (no errors under Deploy → Deployment)

Interfaces and zones are visible

Health Monitor shows all modules up

See bootstrap template:
- ftd-hq-01-bootstrap.json
- ftd-hq-02-bootstrap.json
- fmc-hq-bootstrap.json
