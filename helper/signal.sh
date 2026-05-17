#!/usr/bin/env bash

function handleInterruptByUser() {

  pkill com.termux

  local dark="\e[90m"
  local reset="\033[0m"

  echo -e "\n${dark}  ──────────────────────────────────────────────────────────${reset}"
  echo -e "  [ ${COLOR_WARNING}INTERRUPTED${COLOR_BASED} ] > ${COLOR_DANGER}${1}${COLOR_BASED}"
  echo -e "${dark}  ──────────────────────────────────────────────────────────${reset}\n"

  setCursor on

  read -n 1 -s -r -p "  Press any key to exit "

  exit 1

}
