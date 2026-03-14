#!/usr/bin/env bash
set -euo pipefail

########################################
# Dotfiles Environment Installer
########################################

PACKAGES_FILE="packages.txt"
PROFILE="${1:-desktop}"

########################################
# Colors
########################################

GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RED="\033[1;31m"
BLUE="\033[1;34m"
RESET="\033[0m"

msg(){ echo -e "${BLUE}➜ $1${RESET}"; }
ok(){ echo -e "${GREEN}✓ $1${RESET}"; }
warn(){ echo -e "${YELLOW}⚠ $1${RESET}"; }
err(){ echo -e "${RED}✗ $1${RESET}"; }

########################################
# Profile handling
########################################

if [[ "$PROFILE" == "list" ]]; then
    echo "Available profiles:"
    ls profiles
    exit 0
fi

PROFILE_FILE="profiles/${PROFILE}.txt"

if [[ ! -f "$PROFILE_FILE" ]]; then
    err "Unknown profile: $PROFILE"
    echo "Available profiles:"
    ls profiles
    exit 1
fi

msg "Using profile: $PROFILE"

########################################
# Detect distro
########################################

if [[ -f /etc/os-release ]]; then
    . /etc/os-release
    DISTRO=${ID,,}
    DISTRO_LIKE=${ID_LIKE:-}
else
    err "Cannot detect distro"
    exit 1
fi

msg "Detected distro: $DISTRO"

########################################
# Parse packages
########################################

mapfile -t BASE_PACKAGES < <(awk '{print $1}' "$PACKAGES_FILE")
mapfile -t PROFILE_PACKAGES < <(awk '{print $1}' "$PROFILE_FILE")

ALL_PACKAGES=("${BASE_PACKAGES[@]}" "${PROFILE_PACKAGES[@]}")

########################################
# Arch installer
########################################

install_arch() {

msg "Updating system"

sudo pacman -Syu --noconfirm

PACMAN_INSTALL=()
AUR_INSTALL=()
SKIPPED=()

msg "Analyzing packages"

for pkg in "${ALL_PACKAGES[@]}"; do

    if pacman -Qi "$pkg" &>/dev/null; then
        ok "Installed: $pkg"
        continue
    fi

    if pacman -Si "$pkg" &>/dev/null; then
        PACMAN_INSTALL+=("$pkg")
        continue
    fi

    if curl -s "https://aur.archlinux.org/packages/${pkg}" | grep -q "<title>"; then
        AUR_INSTALL+=("$pkg")
        continue
    fi

    SKIPPED+=("$pkg")

done

########################################
# Pacman install
########################################

if (( ${#PACMAN_INSTALL[@]} )); then

msg "Installing pacman packages"

sudo pacman -S --needed --noconfirm "${PACMAN_INSTALL[@]}"

fi

########################################
# yay install
########################################

if (( ${#AUR_INSTALL[@]} )); then

if ! command -v yay &>/dev/null; then

msg "Installing yay"

sudo pacman -S --needed --noconfirm base-devel git

cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

ok "yay installed"

fi

msg "Installing AUR packages"

yay -S --noconfirm "${AUR_INSTALL[@]}"

fi

########################################
# Skipped report
########################################

if (( ${#SKIPPED[@]} )); then

echo ""
warn "Skipped packages (not found):"

for pkg in "${SKIPPED[@]}"; do
    echo "  - $pkg"
done

fi

ok "Arch installation finished"

}

########################################
# Ubuntu installer
########################################

install_ubuntu() {

msg "Updating apt"

sudo apt update

APT_INSTALL=()

for pkg in "${ALL_PACKAGES[@]}"; do

    if dpkg -s "$pkg" &>/dev/null; then
        ok "Installed: $pkg"
        continue
    fi

    if apt-cache show "$pkg" &>/dev/null; then
        APT_INSTALL+=("$pkg")
    fi

done

if (( ${#APT_INSTALL[@]} )); then

msg "Installing apt packages"

sudo apt install -y "${APT_INSTALL[@]}"

fi

########################################
# Brave install
########################################

if ! command -v brave-browser &>/dev/null; then

msg "Installing Brave browser"

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg \
https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] \
https://brave-browser-apt-release.s3.brave.com/ stable main" \
| sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update
sudo apt install -y brave-browser

fi

ok "Ubuntu installation finished"

}

########################################
# Dispatch installer
########################################

case "$DISTRO" in

arch)
install_arch
;;

ubuntu|debian)
install_ubuntu
;;

*)
if [[ "$DISTRO_LIKE" == *"arch"* ]]; then
install_arch
elif [[ "$DISTRO_LIKE" == *"debian"* ]]; then
install_ubuntu
else
err "Unsupported distro"
exit 1
fi
;;

esac

echo ""
ok "Installation complete."
