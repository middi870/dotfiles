# Linux Dotfiles

Personal Linux development environment configuration used for a **Hyprland-based Wayland desktop**.

This repository contains configuration files, scripts, and tooling that define my daily development workflow.

The goal of this setup is:

* minimal
* keyboard-driven
* reproducible
* developer focused

Primary environment:

```
Arch Linux
Hyprland (Wayland)
Waybar
Kitty
Neovim (LazyVim)
Vim
Bash
```

---

## Setup Instructions

Clone the repository and run the installer scripts.

```bash
git clone https://github.com/middi870/dotfiles
cd dotfiles

./install.sh laptop
./setup.sh
```

The process will:

1. Detect your Linux distribution.
2. Install required system packages.
3. Install AUR packages (on Arch-based systems).
4. Apply the configuration files using symlinks.
5. Set up your development environment automatically.


---

# Repository Structure

```
dotfiles/
├── bash/
├── hypr/
├── waybar/
├── vim/
├── nvim/
├── scripts/
├── packages.txt
└── program_first_arch_installation.txt
```

Directory overview:

| Directory    | Purpose                               |
| ------------ | ------------------------------------- |
| bash         | Bash shell configuration              |
| hypr         | Hyprland window manager configuration |
| waybar       | Wayland status bar configuration      |
| vim          | Minimal Vim setup                     |
| nvim         | LazyVim-based Neovim environment      |
| scripts      | Custom CLI utilities                  |
| packages.txt | List of installed system packages     |

---

# Desktop Environment

The desktop stack is built around **Wayland and Hyprland**.

Core components:

```
Window Manager : Hyprland
Bar            : Waybar
Terminal       : Kitty
Launcher       : Wofi
Notifications  : SwayNC
Wallpaper      : Hyprpaper
File Manager   : Nautilus
```

System services:

```
PipeWire
NetworkManager
Bluetooth (BlueZ)
```

---

# Editors

Two editors are configured.

## Vim

Minimal Vim setup with:

```
vim-commentary
coc.nvim
coc-rust-analyzer
```

Used for lightweight editing.

Location:

```
vim/vimrc
```

---

## Neovim

Neovim uses **LazyVim** with additional plugins.

Features:

* LSP
* Treesitter
* Copilot integration
* Debugging (DAP)
* Integrated terminal
* File explorer (oil.nvim)

Configuration:

```
nvim/
```

---

# Waybar

Waybar provides system status and controls.

Displayed modules include:

```
Workspaces
Clock
Audio
Brightness
CPU
Memory
Battery
System tray
Power menu
```

Custom modules include:

```
Media player integration (Playerctl)
```

Configuration files:

```
waybar/config.jsonc
waybar/style.css
waybar/mediaplayer.py
```

---

# Hyprland

The window manager configuration includes:

* dwindle layout
* keyboard-driven workspace navigation
* screenshot utilities
* multimedia key support
* application launcher

Key applications:

```
kitty
wofi
nautilus
wlogout
```

Configuration file:

```
hypr/hyprland.conf
```

---

# Custom Scripts

Custom CLI tools live in:

```
scripts/
```

Utilities included:

| Script               | Purpose                     |
| -------------------- | --------------------------- |
| mdump                | Markdown project dump tool  |
| pdump                | Plain text project dump     |
| fdump                | Dump all project files      |
| p_tree               | Filtered project tree       |
| bluetooth-connect.sh | Connect to Bluetooth device |
| openrouter-test.sh   | Test OpenRouter API         |

These tools help with:

* debugging
* documentation
* sharing project context
* development workflows

---

# Package List

The file

```
packages.txt
```

contains a list of installed packages exported from the system.

Example usage:

```
pacman -S --needed - < packages.txt
```

This helps recreate the environment on a new machine.

---

# Installation

Clone the repository:

```
git clone https://github.com/middi870/dotfiles.git
cd dotfiles
```

Create configuration links:

```
ln -s ~/dotfiles/bash/bashrc ~/.bashrc
ln -s ~/dotfiles/hypr ~/.config/hypr
ln -s ~/dotfiles/waybar ~/.config/waybar
ln -s ~/dotfiles/vim/vimrc ~/.vimrc
ln -s ~/dotfiles/nvim ~/.config/nvim
```

Scripts can be linked into your PATH:

```
mkdir -p ~/bin
ln -s ~/dotfiles/scripts/* ~/bin/
```

Ensure `~/bin` is in your PATH.

---

# System Requirements

Typical packages used in this environment include:

```
hyprland
waybar
kitty
wofi
hyprpaper
swaync
neovim
vim
playerctl
pipewire
blueman
network-manager-applet
```

Full package list is available in:

```
packages.txt
```

---

# Design Philosophy

This configuration follows a few principles:

Minimalism
Keep configuration readable and maintainable.

Keyboard-driven workflow
Most operations can be performed without using a mouse.

Reproducibility
The entire environment can be recreated from this repository.

Transparency
Everything is configured with plain configuration files.

---

# Author

Aditya Ranjan Jha

Systems / Infrastructure Engineering

