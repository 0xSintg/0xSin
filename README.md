<h1 align="center">0xSin</h1>
<p align="center">Clean. Minimal. Gray. — A Termux dotfiles setup.</p>

<p align="center">
  <img src="https://img.shields.io/badge/license-GPL-555555.svg?style=flat-square">
  <img src="https://img.shields.io/badge/platform-Android%20%7C%20Termux-888888.svg?style=flat-square">
  <img src="https://img.shields.io/badge/shell-zsh-aaaaaa.svg?style=flat-square">
</p>

---

## Preview

```
███████╗██╗███╗         ██╗
██╔════╝██║████╗      ██║   codename@client
███████╗██║██╔██╗   ██║
╚════██║██║██║╚██╗██║    phone   Brand Model
███████║██║██║ ╚████║    os      Android aarch64
╚══════╝╚═╝╚═╝  ╚═══╝    kernel  x.x.x-android
                          pkgs    ###
                          shell   zsh
                          uptime  Xh Xm
                          ram     XXX MB / XXXX MB
                          disk    XXB / XXB  XXB free

━━━━━━━━━━━━━━━━━━━━━━
```

**Shell prompt:**
```
┌─[root@0xSin]─[~]
└─»»» 
```

---

## Requirements

> **Termux must be the F-Droid version.**
> [Download from F-Droid](https://f-droid.org/en/packages/com.termux/)
>
> **Termux:API must also be installed.**
> [Download Termux:API](https://f-droid.org/en/packages/com.termux.api/)

---

## Installation

**1. Update & install dependencies**

```bash
pkg update && pkg upgrade
pkg i -y git bc
```

**2. Clone this repository**

```bash
git clone --depth=1 https://github.com/0xSin/0xSin.git
```

**3. Enter the folder and export screen variables**

```bash
cd 0xSin
export COLUMNS LINES
```

**4. Run the installer**

```bash
./install.sh
```

> If you get a screen size error, zoom out in Termux and run again.

---

## Commands

| Command    | Description                    |
|------------|-------------------------------|
| `chcolor`  | Change terminal colorscheme   |
| `chfont`   | Change terminal font           |
| `chzsh`    | Change ZSH theme               |
| `fetch`    | Show system info (sinfetch)    |
| `neo`      | Launch neofetch                |
| `n`        | Open ncmpcpp music player      |

---

## Features

- **sinfetch** — Custom ASCII system fetch (replaces rxfetch), Android/Termux-native
- **Prompt** — `┌─[root@0xSin]─[~]` / `└─»»»` style with git integration
- **Color theme** — Clean gray palette (no cyan)
- **ZSH** — oh-my-zsh with syntax highlighting, autosuggestions, fzf history
- **Neovim** — NvChad setup
- **tmux** — Configured with themepack
- **Music** — mpd + ncmpcpp
- **eza** — Modern ls replacement with icons

---

## Credits

- [siduck](https://github.com/siduck) — NvChad, onedark colorscheme
- [owl4ce](https://github.com/owl4ce) — Dotfiles inspiration
- [adi1090x](https://github.com/adi1090x) — Termux setup reference
- [bandithijo](https://github.com/bandithijo) — Awesomeshot script
- [nekonako](https://github.com/nekonako) — Color schemes
- [catppuccin/termux](https://github.com/catppuccin/termux) — Color scheme

---

## License

GPL-3.0 — see [LICENSE](./LICENSE)
