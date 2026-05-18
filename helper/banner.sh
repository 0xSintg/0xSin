#!/usr/bin/env bash

VERSION="1.0.0"
BUILD_DATE="2025"
AUTHOR="0xSin"

# Shadow variants for the ASCII logo
# Usage: ascii_shadow [style] [name]
# Styles: default, shadow, hollow, slant

function ascii_logo() {
  local style="${1:-default}"
  local name="${2:-0xSin}"
  local w="\033[1;37m"     # gray primary
  local c="\033[1;36m"     # cyan secondary
  local d="\e[90m"         # dark/shadow
  local y="\033[1;33m"     # yellow alert
  local r="\033[0m"

  case "${style}" in

    shadow )
      # Block letters with dark shadow offset
      echo -e "${d}  ▒██████▒██▒███▒  ██▒"
      echo -e "  ▒██░░░▒██▒████▒ ██▒${r}"
      echo -e "${w}  ███████╗██╗███╗   ██╗${r}"
      echo -e "${w}  ██╔════╝██║████╗  ██║${r}"
      echo -e "${w}  ███████╗██║██╔██╗ ██║${r}"
      echo -e "${w}  ╚════██║██║██║╚██╗██║${r}"
      echo -e "${w}  ███████║██║██║ ╚████║${r}"
      echo -e "${w}  ╚══════╝╚═╝╚═╝  ╚═══╝${r}"
      ;;

    hollow )
      # Outline / hollow style using light chars
      echo -e "${c}  ░█████░█░███░  ██░"
      echo -e "  ░█░░░░░█░████░ ██░"
      echo -e "  ░█████░█░█░██░ █░░"
      echo -e "  ░░░░██░█░█░░██░█░"
      echo -e "  ░█████░█░█░ ░███░"
      echo -e "  ░░░░░░░░░░░░ ░░░░${r}"
      ;;

    slant )
      # Slanted / italic feel with offset
      echo -e "${c}    ███████╗██╗███╗   ██╗"
      echo -e "   ██╔════╝██║████╗  ██║"
      echo -e "  ███████╗██║██╔██╗ ██║"
      echo -e "  ╚════██║██║██║╚██╗██║"
      echo -e "  ███████║██║██║ ╚████║"
      echo -e "  ╚══════╝╚═╝╚═╝  ╚═══╝${r}"
      ;;

    default | * )
      echo -e "${w}  ███████╗██╗███╗   ██╗"
      echo -e "  ██╔════╝██║████╗  ██║"
      echo -e "  ███████╗██║██╔██╗ ██║"
      echo -e "  ╚════██║██║██║╚██╗██║"
      echo -e "  ███████║██║██║ ╚████║"
      echo -e "  ╚══════╝╚═╝╚═╝  ╚═══╝${r}"
      ;;

  esac
}

function banner() {

  local w="\033[1;37m"
  local c="\033[1;36m"
  local d="\e[90m"
  local y="\033[1;33m"
  local g="\e[37m"
  local r="\033[0m"

  # Read saved style; default to 'default'
  local STYLE_FILE="$HOME/.config/0xSin/banner_style"
  local NAME_FILE="$HOME/.config/0xSin/banner_name"
  local style="default"
  local name="0xSin"
  [[ -f "${STYLE_FILE}" ]] && style="$(cat ${STYLE_FILE})"
  [[ -f "${NAME_FILE}" ]]  && name="$(cat ${NAME_FILE})"

  echo -e ""
  echo -e "${d}  ──────────────────────────────────────────────────────────${r}"
  echo -e ""
  ascii_logo "${style}" "${name}"
  echo -e ""
  echo -e "${d}  ──────────────────────────────────────────────────────────${r}"
  echo -e "  ${g}version ${r}${c}${VERSION}${r}   ${g}author ${r}${c}${name}${r}   ${g}build ${r}${c}${BUILD_DATE}${r}"
  echo -e "${d}  ──────────────────────────────────────────────────────────${r}"
  echo -e ""

}
