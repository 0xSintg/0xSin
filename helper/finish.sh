#!/usr/bin/env bash

OXSIN_VERSION="1.0.0"

function alertFinish() {

  local gray="\033[1;37m"
  local dark="\e[90m"
  local reset="\033[0m"

  echo -e "\n${dark}  ──────────────────────────────────────────────────────────${reset}"
  echo -e "  ${gray}  Installation complete${reset}"
  echo -e "  ${dark}Restart Termux to apply all changes.${reset}"
  echo -e "${dark}  ──────────────────────────────────────────────────────────${reset}\n"

}

function alertNotification() {

  IMAGE_PATH="${HOME}/.config/0xSin/alert/images"
  IMAGE_FILE_NAME="finish.png"

  termux-notification --sound -t "0xSin v${OXSIN_VERSION} has been installed" --image-path ${IMAGE_PATH}/${IMAGE_FILE_NAME}

}

function alertTorch() {

  termux-toast -b "#1C1C1C" -c "#D0D0D0" -g middle "0xSin v${OXSIN_VERSION} installed"

}

function mainAlert() {

  alertFinish
  alertNotification
  alertTorch

}
