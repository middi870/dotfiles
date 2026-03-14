#!/usr/bin/env bash
set -euo pipefail

DEVICE="41:42:9F:70:3E:46"

echo "Connecting to Bluetooth device $DEVICE..."
bluetoothctl connect "$DEVICE"
