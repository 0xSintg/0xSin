#!/usr/bin/env bash

PACKAGES=(
  bat curl clang eza fzf git imagemagick
  inotify-tools lf mpd mpc neovim openssh
  neofetch termux-api tmux zsh
)

function packages() {

  setCursor off

  KB_DOWNLOAD_SIZE=0
  MB_DOWNLOAD_SIZE=0

  KB_INSTALLED_SIZE=0
  MB_INSTALLED_SIZE=0

  local gray="\033[1;37m"
  local dark="\e[90m"
  local reset="\033[0m"

  echo -e "\n${dark}  ──────────────────────────────────────────────────────────────────────────────────────${reset}"
  echo -e "  ${gray}  Packages${reset}"
  echo -e "${dark}  ──────────────────────────────────────────────────────────────────────────────────────${reset}"
  printf "    ${dark}%-28s  %-22s  %-12s  %-12s${reset}\n" "Name" "Version" "Download" "Installed"
  echo -e "${dark}  ──────────────────────────────────────────────────────────────────────────────────────${reset}\n"

  for PACKAGE in "${PACKAGES[@]}"; do

    PACKAGE_NAME=$(apt show $PACKAGE 2> /dev/null | grep Package: | awk '{print $2}')
    VERSION=$(apt show $PACKAGE 2> /dev/null | grep Version: | awk '{print $2}')

    DOWNLOAD_SIZE=$(apt show $PACKAGE 2> /dev/null | grep Download-Size: | awk '{print $2}')
    INSTALLED_SIZE=$(apt show $PACKAGE 2> /dev/null | grep Installed-Size: | awk '{print $2}')

    UNIT_DOWNLOAD_SIZE=$(apt show $PACKAGE 2> /dev/null | grep Download-Size: | awk '{print $3}')
    UNIT_INSTALLED_SIZE=$(apt show $PACKAGE 2> /dev/null | grep Installed-Size: | awk '{print $3}')

    printf "    ${COLOR_SUCCESS}%-28s${COLOR_BASED}  ${COLOR_WARNING}%-22s${COLOR_BASED}  ${COLOR_WARNING}%-4s${COLOR_BASED} %-2s      ${COLOR_WARNING}%-4s${COLOR_BASED} %-2s\n" \
      $PACKAGE_NAME $VERSION ${DOWNLOAD_SIZE} "${UNIT_DOWNLOAD_SIZE}" ${INSTALLED_SIZE} "${UNIT_INSTALLED_SIZE}"

    if [[ "${UNIT_DOWNLOAD_SIZE}" == "kB" && "${UNIT_INSTALLED_SIZE}" == "MB" ]]; then
      KB_DOWNLOAD_SIZE=$(echo "${KB_DOWNLOAD_SIZE} + ${DOWNLOAD_SIZE} / 1024" | bc -l | xargs -i printf "%'.1f" {})
      MB_INSTALLED_SIZE=$(echo "${MB_INSTALLED_SIZE} + ${INSTALLED_SIZE}" | bc -l | xargs -i printf "%'.1f" {})
    elif [[ "${UNIT_DOWNLOAD_SIZE}" == "MB" && "${UNIT_INSTALLED_SIZE}" == "kB" ]]; then
      MB_DOWNLOAD_SIZE=$(echo "${MB_DOWNLOAD_SIZE} + ${DOWNLOAD_SIZE}" | bc -l | xargs -i printf "%'.1f" {})
      KB_INSTALLED_SIZE=$(echo "${KB_INSTALLED_SIZE} + ${INSTALLED_SIZE} / 1024" | bc -l | xargs -i printf "%'.1f" {})
    elif [[ "${UNIT_DOWNLOAD_SIZE}" == "kB" && "${UNIT_INSTALLED_SIZE}" == "kB" ]]; then
      KB_DOWNLOAD_SIZE=$(echo "${KB_DOWNLOAD_SIZE} + ${DOWNLOAD_SIZE} / 1024" | bc -l | xargs -i printf "%'.1f" {})
      KB_INSTALLED_SIZE=$(echo "${KB_INSTALLED_SIZE} + ${INSTALLED_SIZE} / 1024" | bc -l | xargs -i printf "%'.1f" {})
    elif [[ "${UNIT_DOWNLOAD_SIZE}" == "MB" && "${UNIT_INSTALLED_SIZE}" == "MB" ]]; then
      MB_DOWNLOAD_SIZE=$(echo "${MB_DOWNLOAD_SIZE} + ${DOWNLOAD_SIZE}" | bc -l | xargs -i printf "%'.1f" {})
      MB_INSTALLED_SIZE=$(echo "${MB_INSTALLED_SIZE} + ${INSTALLED_SIZE}" | bc -l | xargs -i printf "%'.1f" {})
    fi

  done

  TOTAL_DOWNLOAD_SIZE=$(echo "${KB_DOWNLOAD_SIZE} + ${MB_DOWNLOAD_SIZE}" | bc -l | xargs -i printf "%'.1f" {})
  TOTAL_INSTALLED_SIZE=$(echo "${KB_INSTALLED_SIZE} + ${MB_INSTALLED_SIZE}" | bc -l | xargs -i printf "%'.1f" {})

  echo -e "\n${dark}  ──────────────────────────────────────────────────────────────────────────────────────${reset}"
  printf "    ${dark}TOTAL%-23s${reset}  ${COLOR_WARNING}%-22s${COLOR_BASED}  ${COLOR_WARNING}%-6s${COLOR_BASED} MB      ${COLOR_WARNING}%-6s${COLOR_BASED} MB\n" \
    "" "" ${TOTAL_DOWNLOAD_SIZE} ${TOTAL_INSTALLED_SIZE}
  echo -e "${dark}  ──────────────────────────────────────────────────────────────────────────────────────${reset}\n"

}

function installPackages() {

  setCursor off

  echo -e "\n  Installing Packages\n"

  for PACKAGE in "${PACKAGES[@]}"; do

    start_animation "       Installing ${COLOR_WARNING}'${COLOR_SUCCESS}${PACKAGE}${COLOR_WARNING}'${COLOR_BASED} ..."

    pkg i -y $PACKAGE &>/dev/null
    THIS_PACKAGE=$(pkg list-installed $PACKAGE 2> /dev/null | tail -n 1)
    CHECK_PACKAGE=${THIS_PACKAGE%/*}

    if [[ $CHECK_PACKAGE == $PACKAGE ]]; then
      stop_animation $? || exit 1
    else
      stop_animation $?
    fi

  done

  setCursor on

}
