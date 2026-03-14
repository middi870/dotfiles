# Bash Configuration

Minimal Bash configuration focused on clarity, usability, and compatibility with Wayland-based environments.

This configuration is part of my Linux development environment and is designed to work well with terminal emulators such as **Kitty** while remaining lightweight and predictable.

---

# Repository Structure

```
bash/
├── bashrc
└── README.md
```

File descriptions:

| File      | Purpose                             |
| --------- | ----------------------------------- |
| bashrc    | Main interactive Bash configuration |
| README.md | Documentation for the configuration |

---

# Features

## Clean Prompt

The prompt shows:

* username
* hostname
* current working directory

Example:

```
user@machine ~/projects $
```

Color scheme:

* **green** → user@host
* **blue** → working directory

Prompt definition:

```
PS1='\e[1;32m\u@\h\e[0m \e[0;34m\w\e[0m \$ '
```

---

# Aliases

Useful command shortcuts are defined for common tasks.

### File listing

```
ls   → colored listing
ll   → long listing
la   → show hidden files
lh   → show only hidden files
```

Examples:

```
ll
la
lh
```

---

### Grep highlighting

```
grep --color=auto
```

This highlights matched text automatically.

---

# Speech Alias

A helper alias is included for **text-to-speech** using Piper.

Command:

```
speak
```

This uses:

```
piper-tts
mpv
```

Pipeline:

```
piper-tts → generate speech.wav
mpv → play generated audio
```

Example usage:

```
echo "Hello world" | speak
```

---

# Kitty + Wayland Fix

Some Wayland terminals may show duplicated pasted text due to **bracketed paste mode**.

This configuration disables it to avoid visual glitches:

```
bind 'set enable-bracketed-paste off'
```

This specifically helps when using:

```
kitty
wayland
bash
```

---

# Installation

Copy the configuration into your home directory.

Example:

```
cp bashrc ~/.bashrc
```

Or using a dotfiles setup:

```
ln -s ~/dotfiles/bash/bashrc ~/.bashrc
```

Reload Bash:

```
source ~/.bashrc
```

---

# Requirements

Optional tools used by aliases:

```
piper-tts
mpv
```

Example installation (Arch Linux):

```
sudo pacman -S mpv
```

---

# Notes

This configuration intentionally avoids heavy customization and keeps Bash behavior predictable.

Features such as:

* prompt theming frameworks
* large plugin systems

are intentionally avoided to keep startup fast and the configuration easy to maintain.

---

# Author

Aditya Ranjan Jha
Systems / Infrastructure Engineering
