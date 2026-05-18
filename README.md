<div align="center">

```
███████╗██╗███╗   ██╗
██╔════╝██║████╗  ██║
███████╗██║██╔██╗ ██║
╚════██║██║██║╚██╗██║
███████║██║██║ ╚████║
╚══════╝╚═╝╚═╝  ╚═══╝
```

**A clean, minimal Termux dotfiles setup for Android.**

![version](https://img.shields.io/badge/version-1.0.0-555555?style=flat-square)
![platform](https://img.shields.io/badge/platform-Android%20%7C%20Termux-36b2b2?style=flat-square)
![shell](https://img.shields.io/badge/shell-zsh-888888?style=flat-square)
![license](https://img.shields.io/badge/license-GPL--3.0-555555?style=flat-square)

</div>

---

## Preview

```
███████╗██╗███╗   ██╗   root@0xSin
██╔════╝██║████╗  ██║
███████╗██║██╔██╗ ██║   phone   <Test Preview only
╚════██║██║██║╚██╗██║   os      Android aarch64
███████║██║██║ ╚████║   kernel  4.14.186-android
╚══════╝╚═╝╚═╝  ╚═══╝   pkgs    352
                           shell   zsh
                           uptime  9h 37m
                           ram     4463MB / 7840MB
                           disk    14GB / 228GB  84GB free

  ───────────────────────────────
```

```
┌─[root@0xSin]─[~]
└─»»»
```

---

## Requirements

> Install both from **F-Droid** — the Play Store versions do not support all features.

| App | Link |
|-----|------|
| Termux | [F-Droid](https://f-droid.org/en/packages/com.termux/) |
| Termux:API | [F-Droid](https://f-droid.org/en/packages/com.termux.api/) |

---

## Installation

```bash
# 1. Update packages
pkg update && pkg upgrade

# 2. Install dependencies
pkg i -y git bc

# 3. Clone
git clone --depth=1 https://github.com/0xSintg/0xSin.git

# 4. Enter directory
cd 0xSin

# 5. Export screen variables
export COLUMNS LINES

# 6. Run installer
./install.sh
```

> If you get a screen size error, zoom out in Termux and run again.

During installation you will be prompted to configure:

```
Banner name  [blank = 0xSin]   »
ASCII style  [1-4]             »
Prompt name  [blank = 0xSin]   »  →  root@<name>
```

---

## ASCII Styles

| # | Style | Description |
|---|-------|-------------|
| 1 | `default` | Clean white block letters |
| 2 | `shadow` | Dark gray shadow offset |
| 3 | `hollow` | Cyan outline |
| 4 | `slant` | Shifted indent |

Change anytime after install:

```bash
chbanner
```

---

## Color System

| Role | Color | Used for |
|------|-------|----------|
| Primary | Gray | Borders, separators, backgrounds |
| Secondary | Cyan | Labels, interactive elements, prompt |
| Alert | Yellow | Warnings, errors, notifications |

---

## Commands

### System
| Command | Description |
|---------|-------------|
| `fetch` | Show system info (sinfetch) |
| `neo` | Launch neofetch |
| `c` | Clear screen |
| `q` | Exit shell |

### Customization
| Command | Description |
|---------|-------------|
| `chprompt` | Change prompt name (`root@<name>`) |
| `chbanner` | Change banner name and ASCII style |
| `chcolor` | Change terminal colorscheme |
| `chfont` | Change terminal font |
| `chzsh` | Change ZSH theme |

### Info
| Command | Description |
|---------|-------------|
| `colorused` | Show active colorscheme |
| `fontused` | Show active font |
| `zshused` | Show active ZSH theme |
| `disk` | Show storage info |
| `battery` | Show battery status |

### Navigation
| Command | Description |
|---------|-------------|
| `sd` | Go to `/sdcard` |
| `pf` | Go to `$PREFIX` |
| `dl` | Go to Downloads |
| `ds` | Go to Documents |
| `ms` | Go to Movies |
| `ss` | Go to Screenshots |

### Network
| Command | Description |
|---------|-------------|
| `myip` | SIM card IP |
| `myipwifi` | WiFi IP |
| `myiphotspot` | Hotspot IP |
| `myipvpn` | VPN IP |
| `myipall` | All interfaces |
| `pg` | Ping Google |

### Packages
| Command | Description |
|---------|-------------|
| `pacupg` | Upgrade packages |
| `pacupd` | Update package lists |
| `pacupgupd` | Update and upgrade |

### Git
| Command | Description |
|---------|-------------|
| `gitgraph` | Visual commit graph |
| `gitupdate` | Fetch and pull |
| `gitstat` | Git status |

---

## Packages Installed

```
bat           curl          clang         eza
fzf           git           imagemagick   inotify-tools
lf            mpd           mpc           neovim
neofetch      openssh       termux-api    tmux
zsh
```

---

## ZSH Plugins

- `zsh-syntax-highlighting` — command syntax coloring
- `zsh-autosuggestions` — fish-style inline suggestions
- `zsh-fzf-history-search` — fuzzy history search
- `zsh-autocomplete` — real-time completion menu

---

## File Structure

```
0xSin/
├── install.sh              # Main installer
├── helper/
│   ├── banner.sh           # ASCII logo + styles
│   ├── colors.sh           # Color palette
│   ├── animation.sh        # Spinner animation
│   ├── package.sh          # Package list + install
│   ├── dotfiles.sh         # Dotfile backup + install
│   ├── clone.sh            # Repository cloning
│   ├── themes.sh           # ZSH theme install
│   ├── finish.sh           # Completion screen
│   └── ...
├── .zshrc                  # ZSH config
├── .aliases                # All aliases
├── .autostart              # Shell startup (runs sinfetch)
├── .local/bin/
│   ├── sinfetch            # System fetch script
│   ├── chprompt            # Change prompt name
│   └── chbanner            # Change banner name/style
├── .oh-my-zsh/custom/themes/
│   └── ma.zsh-theme        # 0xSin prompt theme
├── .termux/
│   ├── colors.properties   # Terminal color palette
│   └── termux.properties   # Termux settings
└── .colorscheme/           # Color theme files
```

---

## Credits

- [siduck](https://github.com/siduck) — NvChad
- [owl4ce](https://github.com/owl4ce) — Dotfiles inspiration
- [adi1090x](https://github.com/adi1090x) — Termux setup reference
- [nekonako](https://github.com/nekonako) — Color schemes
- [catppuccin](https://github.com/catppuccin/termux) — Color scheme base

---

## License

[GPL-3.0](./LICENSE) — do whatever you want, keep it open.
