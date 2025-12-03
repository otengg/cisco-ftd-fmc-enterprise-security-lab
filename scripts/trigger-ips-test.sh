#!/bin/bash

echo "=== Triggering safe IPS / malware test traffic ==="

# EICAR test string (if your IPS/File policy inspects HTTP)
# Many environments block this; it's safe and widely used for testing.

curl http://www.eicar.org/download/eicar.com -o /tmp/eicar.com || echo "Download blocked (expected if IPS/file policy active)."

echo
echo "Now check FMC:"
echo "- Analysis → Intrusion → Events"
echo "- Analysis → Malware / Files"
