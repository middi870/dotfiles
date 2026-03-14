#!/usr/bin/env bash
set -euo pipefail

########################################
# Update packages.txt from current system
# Author: Aditya Ranjan Jha
########################################

OUTPUT="packages.txt"
TMP="$(mktemp)"

echo "Updating package list..."

# Get explicitly installed packages (no dependencies)
pacman -Qqe > "$TMP"

# Remove base packages if base group exists
if pacman -Qg base >/dev/null 2>&1; then
    pacman -Qg base | awk '{print $2}' >> "$TMP.base"
    pacman -Qg base-devel | awk '{print $2}' >> "$TMP.base"
    grep -vxFf "$TMP.base" "$TMP" > "$TMP.clean"
else
    cp "$TMP" "$TMP.clean"
fi

# Sort and remove duplicates
sort -u "$TMP.clean" > "$OUTPUT"

rm -f "$TMP" "$TMP.base" "$TMP.clean"

echo "packages.txt updated."
echo ""
echo "Total packages:"
wc -l "$OUTPUT"
