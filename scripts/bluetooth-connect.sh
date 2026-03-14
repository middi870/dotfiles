#!/usr/bin/env bash
set -euo pipefail

DEVICE="41:42:9F:70:3E:46"
RETRIES=5

if ! command -v bluetoothctl >/dev/null; then
    echo "Error: bluetoothctl not installed."
    exit 1
fi

echo "Connecting to Bluetooth device $DEVICE..."

for ((i=1; i<=RETRIES; i++)); do
    if bluetoothctl connect "$DEVICE"; then
        echo "Connected successfully."
        exit 0
    fi

    echo "Attempt $i failed. Retrying..."
    sleep 2
done

echo "Failed to connect after $RETRIES attempts."
exit 1
