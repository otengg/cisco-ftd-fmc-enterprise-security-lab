#!/bin/bash

echo "=== Verifying NAT behavior through FTD ==="

echo "[1] Show internal IP on this host:"
ip addr show | grep "inet " | sed 's/^\s*//'

echo
echo "[2] Check translated IP (what the internet sees):"
curl ifconfig.me || echo "Unable to reach ifconfig.me"

echo
echo "[3] Ping external host (ICMP):"
ping -c 4 8.8.8.8 || echo "Ping failed"

echo
echo "If translated IP != internal IP, NAT is working as expected."
echo "Confirm details in FMC → Analysis → Connections / NAT."
