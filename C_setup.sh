#!/usr/bin/env bash
set -euo pipefail

# ==========================================
# Dotfiles Installer
# Author: Aditya Ranjan Jha
# ==========================================

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"
BIN_DIR="$HOME/bin"
BACKUP_DIR="$HOME/.dotfiles_backup"

# ----------------------------------
# Colors
# ----------------------------------

GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RED="\033[1;31m"
BLUE="\033[1;34m"
RESET="\033[0m"

msg() { echo -e "${BLUE}➜ $1${RESET}"; }
ok() { echo -e "${GREEN}✓ $1${RESET}"; }
warn() { echo -e "${YELLOW}⚠ $1${RESET}"; }
err() { echo -e "${RED}✗ $1${RESET}"; }

echo ""
echo "===================================="
echo " Dotfiles Installer"
echo "===================================="
echo ""

# ----------------------------------
# Directories
# ----------------------------------

msg "Creating required directories"

mkdir -p "$CONFIG_DIR"
mkdir -p "$BIN_DIR"
mkdir -p "$BACKUP_DIR"

ok "~/.config"
ok "~/bin"
ok "~/.dotfiles_backup"

echo ""

# ----------------------------------
# Backup + link function
# ----------------------------------

link_config() {

    src="$1"
    dest="$2"

    if [[ -L "$dest" ]]; then
        warn "Already linked: $dest"
        return
    fi

    if [[ -e "$dest" ]]; then
        warn "Backing up existing: $dest"
        mv "$dest" "$BACKUP_DIR/"
    fi

    ln -s "$src" "$dest"
    ok "Linked $dest"
}

# ----------------------------------
# Bash
# ----------------------------------

msg "Configuring Bash"

link_config "$DOTFILES_DIR/bash/bashrc" "$HOME/.bashrc"

echo ""

# ----------------------------------
# Hyprland
# ----------------------------------

msg "Configuring Hyprland"

link_config "$DOTFILES_DIR/hypr" "$CONFIG_DIR/hypr"

echo ""

# ----------------------------------
# Waybar
# ----------------------------------

msg "Configuring Waybar"

link_config "$DOTFILES_DIR/waybar" "$CONFIG_DIR/waybar"

echo ""

# ----------------------------------
# Vim
# ----------------------------------

msg "Configuring Vim"

link_config "$DOTFILES_DIR/vim/vimrc" "$HOME/.vimrc"

echo ""

# ----------------------------------
# Neovim
# ----------------------------------

msg "Configuring Neovim"

link_config "$DOTFILES_DIR/nvim" "$CONFIG_DIR/nvim"

echo ""

# ----------------------------------
# Scripts
# ----------------------------------

msg "Installing scripts"

for script in "$DOTFILES_DIR/scripts/"*; do

    name=$(basename "$script")

    if [[ -d "$script" ]]; then
        continue
    fi

    link_config "$script" "$BIN_DIR/$name"

done

echo ""

# ----------------------------------
# Finish
# ----------------------------------

echo "===================================="
ok "Dotfiles installation complete"
echo "===================================="
echo ""

echo "Next steps:"
echo ""
echo "1. Reload shell:"
echo "   source ~/.bashrc"
echo ""
echo "2. Ensure ~/bin is in PATH:"
echo "   export PATH=\"\$HOME/bin:\$PATH\""
echo ""
