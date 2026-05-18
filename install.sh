#!/usr/bin/env bash

HELPERS=(
  colors animation banner package switchcase
  dotfiles clone themes nvchad utility
  stat signal screen cursor finish
)

for HELPER in ${HELPERS[@]}; do
  source $(pwd)/helper/${HELPER}.sh
done

# ── Config Setup ────────────────────────────────────────────

function setupConfig() {

  mkdir -p "$HOME/.config/0xSin"

  local c="\033[1;36m"   # cyan — interactive
  local y="\033[1;33m"   # yellow — alert
  local w="\033[1;37m"   # gray
  local d="\e[90m"
  local r="\033[0m"

  echo -e "\n${d}  ──────────────────────────────────────────────────────────${r}"
  echo -e "  ${c}  Setup${r}"
  echo -e "${d}  ──────────────────────────────────────────────────────────${r}\n"

  # ── Banner Name ──────────────────────────────────────────
  echo -e "  ${w}Banner name ${d}[leave blank for 0xSin]${r}"
  echo -en "  ${c}»${r} "
  read BANNER_NAME
  BANNER_NAME="${BANNER_NAME:-0xSin}"
  echo "${BANNER_NAME}" > "$HOME/.config/0xSin/banner_name"

  # ── ASCII Shadow Style ────────────────────────────────────
  echo -e ""
  echo -e "  ${w}ASCII style${r}"
  echo -e "  ${d}[1]${r} ${w}default${r}  — clean block"
  echo -e "  ${d}[2]${r} ${c}shadow${r}   — offset shadow"
  echo -e "  ${d}[3]${r} ${c}hollow${r}   — outline"
  echo -e "  ${d}[4]${r} ${c}slant${r}    — shifted"
  echo -en "\n  ${c}»${r} "
  read STYLE_CHOICE
  case "${STYLE_CHOICE}" in
    1) BANNER_STYLE="default" ;;
    2) BANNER_STYLE="shadow"  ;;
    3) BANNER_STYLE="hollow"  ;;
    4) BANNER_STYLE="slant"   ;;
    *) BANNER_STYLE="default" ;;
  esac
  echo "${BANNER_STYLE}" > "$HOME/.config/0xSin/banner_style"

  # ── Prompt Name ───────────────────────────────────────────
  echo -e ""
  echo -e "  ${w}Prompt name ${d}[leave blank for 0xSin]${r}"
  echo -e "  ${d}Will appear as: root@<name>${r}"
  echo -en "  ${c}»${r} "
  read PROMPT_NAME
  PROMPT_NAME="${PROMPT_NAME:-0xSin}"
  echo "${PROMPT_NAME}" > "$HOME/.config/0xSin/prompt_name"

  echo -e ""
  echo -e "  ${y}  Configured:${r}"
  echo -e "  ${d}banner${r}  ${c}${BANNER_NAME}${r}  ${d}style${r}  ${c}${BANNER_STYLE}${r}  ${d}prompt${r}  ${c}root@${PROMPT_NAME}${r}"
  echo -e ""

}

# ── Main ─────────────────────────────────────────────────────

function main() {

  trap 'handleInterruptByUser "Interrupted"' 2

  clear
  banner

  setupConfig

  packages
  switchCase "Install" "Packages" installPackages

  dotFiles
  backupDotFiles
  switchCase "Install" "Dotfiles" installDotFiles

  repositories
  switchCase "Clone" "Repositories" cloneRepository

  zshTheme
  switchCase "Install" "ZSH Themes" installZshTheme

  NvChad
  utility

  mainAlert

}

screenSize main
