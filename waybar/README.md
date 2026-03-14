# Waybar Configuration

Minimal and practical **Waybar configuration for Hyprland** focused on usability, clarity, and lightweight system monitoring.

This configuration is part of my Linux development environment and integrates system status, media playback, and quick system controls into a single top bar.

---

# Overview

Waybar is used as the primary status bar for my Hyprland desktop environment.
The configuration emphasizes:

* clean layout
* minimal visual noise
* useful system metrics
* media playback integration

Layout structure:

```
Left   : keyboard state + workspaces  
Center : clock  
Right  : audio, brightness, system stats, tray, battery, power menu
```

---

# Repository Structure

```
waybar/
├── config.jsonc
├── style.css
├── mediaplayer.py
└── power_menu.xml
```

File descriptions:

| File           | Purpose                             |
| -------------- | ----------------------------------- |
| config.jsonc   | Main Waybar configuration           |
| style.css      | Bar styling                         |
| mediaplayer.py | Playerctl-based media status module |
| power_menu.xml | GTK power menu definition           |

---

# Features

## Workspace Integration

Displays Hyprland workspaces with icons.

Examples:

```
 terminal
 browser
 development
```

Scrolling is disabled to prevent accidental workspace switching.

---

## Media Player Integration

Media information is displayed using a **custom Python module** built on top of `playerctl`.

Supported players:

* Spotify
* VLC
* mpv
* any MPRIS-compatible player

Displayed format:

```
 Artist - Track
 Paused Track
```

The script automatically selects the **most relevant active player**.

---

## System Monitoring

The bar includes lightweight monitoring modules:

* CPU usage
* memory usage
* battery level
* screen brightness
* audio volume
* system tray

Some modules support quick actions:

| Module | Action              |
| ------ | ------------------- |
| CPU    | opens `htop`        |
| Memory | opens `htop`        |
| Volume | opens `pavucontrol` |

---

## Power Controls

The power module provides quick access to system power actions.

Supported actions:

* suspend
* hibernate
* shutdown
* reboot

These actions are defined in:

```
power_menu.xml
```

and can be connected to `wlogout` or other power managers.

---

# Dependencies

Required packages:

```
waybar
playerctl
python-gobject
glib
```

Example installation on Arch Linux:

```
sudo pacman -S waybar playerctl python-gobject
```

Optional utilities used by modules:

```
htop
pavucontrol
wlogout
kitty
```

---

# Installation

Copy the configuration into the Waybar config directory.

```
~/.config/waybar/
```

Example:

```
cp -r waybar ~/.config/
```

or using a dotfiles setup:

```
ln -s ~/dotfiles/waybar ~/.config/waybar
```

---

# Running Waybar

Launch Waybar normally:

```
waybar
```

If using Hyprland, Waybar is typically started automatically via the Hyprland configuration.

---

# Custom Media Module

The media module is powered by:

```
mediaplayer.py
```

This script:

* monitors media player events
* updates Waybar dynamically
* avoids polling
* prioritizes currently playing media

It uses:

```
Playerctl + GLib event loop
```

Output format follows Waybar JSON protocol.

---

# Customization

Common changes you might want to make:

### change workspace icons

Edit:

```
config.jsonc
```

section:

```
hyprland/workspaces -> format-icons
```

---

### change fonts

Edit:

```
style.css
```

Example:

```
font-family: "JetBrains Mono", "Fira Code", monospace;
```

---

### adjust module order

Modify:

```
modules-left
modules-center
modules-right
```

inside `config.jsonc`.

---

# Notes

This configuration is designed to be:

* minimal
* readable
* easy to modify
* low overhead

It avoids heavy scripting and unnecessary background polling.

---

# Author

Aditya Ranjan Jha
Systems / Infrastructure Engineering

