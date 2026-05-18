#!/usr/bin/env bash

OXSIN_VERSION="1.0.0"

function alertFinish() {

  local w="\033[1;37m"
  local c="\033[1;36m"
  local y="\033[1;33m"
  local d="\e[90m"
  local r="\033[0m"

  local _NAME_FILE="$HOME/.config/0xSin/prompt_name"
  local _NAME="$( [[ -f ${_NAME_FILE} ]] && cat ${_NAME_FILE} || echo '0xSin' )"

  echo -e "\n${d}  ──────────────────────────────────────────────────────────${r}"
  echo -e "  ${c}  Installation complete${r}"
  echo -e "  ${d}prompt ${r}${c}root@${_NAME}${r}"
  echo -e "  ${y}  Restart Termux to apply all changes.${r}"
  echo -e "${d}  ──────────────────────────────────────────────────────────${r}"
  echo -e ""
  echo -e "  ${d}chprompt${r}   — change prompt name anytime"
  echo -e "  ${d}chbanner${r}   — change banner name/style anytime"
  echo -e "  ${d}fetch${r}      — show system info"
  echo -e ""

}

function alertNotification() {
  IMAGE_PATH="${HOME}/.config/0xSin/alert/images"
  IMAGE_FILE_NAME="finish.png"
  termux-notification --sound -t "0xSin v${OXSIN_VERSION} installed" --image-path ${IMAGE_PATH}/${IMAGE_FILE_NAME}
}

function alertTorch() {
  termux-toast -b "#111111" -c "#00CCCC" -g middle "0xSin v${OXSIN_VERSION} installed"
}

function mainAlert() {
  alertFinish
  alertNotification
  alertTorch
}
