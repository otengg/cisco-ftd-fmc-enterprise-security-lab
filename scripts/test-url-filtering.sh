#!/bin/bash

echo "=== Testing URL filtering categories ==="

# These are just examples — adjust to whatever categories you configured.

echo "[1] Gambling test (if blocked)"
curl -I http://www.pokerstars.com || echo "Request blocked or failed."

echo
echo "[2] Adult content test (if blocked)"
curl -I http://www.playboy.com || echo "Request blocked or failed."

echo
echo "[3] Malware / suspicious site (if configured)"
curl -I http://www.eicar.org || echo "Request blocked or failed."

echo
echo "Check FMC → Analysis → URL for category and action."
