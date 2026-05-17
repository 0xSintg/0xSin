#!/usr/bin/env bash

VERSION="1.0.0"
BUILD_DATE="2025"
AUTHOR="0xSin"

function banner() {

  local gray="\033[1;37m"
  local dark="\e[90m"
  local reset="\033[0m"
  local dim="\e[37m"

  echo -e "
${dark}  ──────────────────────────────────────────────────────────${reset}

${gray}  ███████╗██╗███╗         ██╗${reset}
${gray}  ██╔════╝██║████╗      ██║${reset}
${gray}  ███████╗██║██╔██╗   ██║${reset}
${gray}  ╚════██║██║██║╚██╗██║${reset}
${gray}  ███████║██║██║ ╚████║${reset}
${gray}  ╚══════╝╚═╝╚═╝  ╚═══╝${reset}

${dark}  ──────────────────────────────────────────────────────────${reset}
${dim}    version  ${reset}${gray}${VERSION}${reset}      ${dim}author  ${reset}${gray}${AUTHOR}${reset}      ${dim}build  ${reset}${gray}${BUILD_DATE}${reset}
${dark}  ──────────────────────────────────────────────────────────${reset}
  "
}
