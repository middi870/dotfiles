# Hyprland Configuration

Minimal and practical **Hyprland configuration** focused on productivity, keyboard-driven workflow, and integration with Waybar.

This configuration is part of my Linux desktop environment and is designed to work with:

* Waybar
* Wofi
* Kitty
* Hyprpaper
* Playerctl
* PipeWire

---

# Overview

The configuration uses the **dwindle layout** with small gaps, light animations, and simple window management shortcuts.

Desktop structure:

```
Terminal: kitty
Launcher: wofi
File Manager: nautilus
Bar: waybar
Wallpaper: hyprpaper
Notifications: swaync
```

---

# Repository Structure

```
hypr/
└── hyprland.conf
```

The configuration can later be split into multiple files if needed using:

```
source = ~/.config/hypr/other_config.conf
```

---

# Autostart Programs

The following programs start automatically when Hyprland launches:

```
waybar
hyprpaper
nm-applet
blueman-applet
swaync
```

Bluetooth auto-connect is delayed using a terminal launch:

```
kitty -e bash -c "sleep 5 && bluetooth-connect.sh"
```

---

# Keybindings

Main modifier key:

```
SUPER (Windows key)
```

Core actions:

| Shortcut      | Action                      |
| ------------- | --------------------------- |
| SUPER + SPACE | Application launcher (wofi) |
| SUPER + Q     | Open terminal               |
| SUPER + E     | Open file manager           |
| SUPER + C     | Close active window         |
| SUPER + V     | Toggle floating window      |
| SUPER + M     | Exit Hyprland               |
| SUPER + X     | Power menu (wlogout)        |

---

# Workspace Management

Switch workspace:

```
SUPER + [1-0]
```

Move window to workspace:

```
SUPER + SHIFT + [1-0]
```

Special scratchpad workspace:

```
SUPER + S
SUPER + SHIFT + S
```

Scroll workspace:

```
SUPER + mouse scroll
```

---

# Window Management

Move focus:

```
SUPER + Arrow keys
```

Move window:

```
SUPER + Left Mouse Drag
```

Resize window:

```
SUPER + Right Mouse Drag
```

Toggle pseudotiling:

```
SUPER + P
```

---

# Screenshots

Full screen screenshot:

```
Print
```

Area screenshot:

```
SUPER + SHIFT + Print
```

Area screenshot copied to clipboard:

```
CTRL + SHIFT + Print
```

Screenshots are saved in:

```
~/Pictures/Screenshots/
```

Tools used:

```
grim
slurp
wl-copy
notify-send
```

---

# Multimedia Keys

Volume control:

```
XF86AudioRaiseVolume
XF86AudioLowerVolume
XF86AudioMute
```

Microphone mute:

```
XF86AudioMicMute
```

Brightness control:

```
XF86MonBrightnessUp
XF86MonBrightnessDown
```

Media playback:

```
XF86AudioNext
XF86AudioPrev
XF86AudioPlay
XF86AudioPause
```

Playback control uses:

```
playerctl
```

---

# Window Layout

Layout:

```
dwindle
```

Configuration:

```
gaps_in = 5
gaps_out = 7
border_size = 1
rounding = 5
```

Blur and shadows are enabled for a lightweight visual effect.

---

# Environment Variables

Cursor and scaling configuration:

```
XCURSOR_SIZE=24
HYPRCURSOR_SIZE=24
QT_SCALE_FACTOR=1
GDK_SCALE=1
```

---

# Dependencies

Required packages:

```
hyprland
kitty
wofi
waybar
hyprpaper
swaync
grim
slurp
wl-clipboard
playerctl
brightnessctl
pavucontrol
nm-applet
blueman
```

Example installation (Arch Linux):

```
sudo pacman -S hyprland kitty wofi waybar hyprpaper swaync grim slurp wl-clipboard playerctl brightnessctl pavucontrol network-manager-applet blueman
```

---

# Notes

This configuration is designed to be:

* minimal
* keyboard driven
* easy to modify
* compatible with Waybar modules

Animations are enabled but tuned to remain lightweight.

---

# Author

Aditya Ranjan Jha
Systems / Infrastructure Engineering

