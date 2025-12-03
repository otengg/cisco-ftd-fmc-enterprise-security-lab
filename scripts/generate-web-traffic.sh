#!/bin/bash

echo "=== Generating general web traffic through FTD ==="

# Simple HTTP and HTTPS requests
curl -I http://example.com
curl -I https://google.com
curl -I https://github.com

# Download a small file to trigger file inspection
curl -O https://speed.hetzner.de/100MB.bin

# DNS lookups
nslookup google.com
nslookup cisco.com

echo "Done. Check FMC → Analysis → Connections / Files / Malware."
