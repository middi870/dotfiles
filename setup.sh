#!/usr/bin/env bash
set -euo pipefail

# ==========================================
# Dotfiles Setup Script
# Author: Aditya Ranjan Jha
# ==========================================

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"
BIN_DIR="$HOME/bin"

echo "===================================="
echo "Dotfiles Setup"
echo "Directory: $DOTFILES_DIR"
echo "===================================="
echo ""

# ----------------------------------
# helper
# ----------------------------------

link_file() {
    src="$1"
    dest="$2"

    if [[ -e "$dest" || -L "$dest" ]]; then
        echo "⚠ Skipping (exists): $dest"
    else
        ln -s "$src" "$dest"
        echo "✓ Linked $dest"
    fi
}

# ----------------------------------
# Create directories
# ----------------------------------

echo "Creating directories..."

mkdir -p "$CONFIG_DIR"
mkdir -p "$BIN_DIR"

echo "✓ ~/.config"
echo "✓ ~/bin"
echo ""

# ----------------------------------
# Bash
# ----------------------------------

echo "Setting up Bash..."

link_file "$DOTFILES_DIR/bash/bashrc" "$HOME/.bashrc"

echo ""

# ----------------------------------
# Hyprland
# ----------------------------------

echo "Setting up Hyprland..."

link_file "$DOTFILES_DIR/hypr" "$CONFIG_DIR/hypr"

echo ""

# ----------------------------------
# Waybar
# ----------------------------------

echo "Setting up Waybar..."

link_file "$DOTFILES_DIR/waybar" "$CONFIG_DIR/waybar"

echo ""

# ----------------------------------
# Vim
# ----------------------------------

echo "Setting up Vim..."

link_file "$DOTFILES_DIR/vim/vimrc" "$HOME/.vimrc"

echo ""

# ----------------------------------
# Neovim
# ----------------------------------

echo "Setting up Neovim..."

link_file "$DOTFILES_DIR/nvim" "$CONFIG_DIR/nvim"

echo ""

# ----------------------------------
# Scripts
# ----------------------------------

echo "Installing scripts..."

for script in "$DOTFILES_DIR/scripts/"*; do
    name=$(basename "$script")

    # skip directories like prev_samples
    if [[ -d "$script" ]]; then
        continue
    fi

    link_file "$script" "$BIN_DIR/$name"
done

echo ""

# ----------------------------------
# Done
# ----------------------------------

echo "===================================="
echo "Setup complete"
echo "===================================="
echo ""
echo "Reload shell:"
echo "  source ~/.bashrc"
echo ""
echo "Ensure ~/bin is in PATH."
echo ""
