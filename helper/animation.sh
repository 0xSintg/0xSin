#!/usr/bin/env bash

# Credits:
#   Bash Spinner : https://github.com/tlatsas/bash-spinner
#   WhiteSur-GTK-Theme (Line 148-217) : https://github.com/vinceliuice/WhiteSur-gtk-theme/blob/master/lib-core.sh

export COLOR_DEFAULT="\033[0m"
export COLOR_BLUE="\033[1;34m"
export COLOR_MAGENTA="\033[1;35m"
export COLOR_CYAN="\033[1;37m"    # gray
export COLOR_GREEN="\033[1;32m"
export COLOR_RED="\033[1;31m"
export COLOR_YELLOW="\033[1;33m"
export COLOR_GRAY="\033[1;37m"
export COLOR_DARK="\e[90m"

ICON="● "
OK="SUCCESS"
NO="FAILED"

# Gray-toned animation (clean aesthetic)
ARRAY_ANIMATION=(
  "\e[90m${ICON}\033[1;37m${ICON}\e[37m${ICON}\e[90m${ICON}\e[90m${ICON}    "
  " \033[1;37m${ICON}\e[37m${ICON}\e[90m${ICON}\e[90m${ICON}\e[90m${ICON}   "
  "  \e[37m${ICON}\e[90m${ICON}\e[90m${ICON}\033[1;37m${ICON}\e[90m${ICON}  "
  "   \e[90m${ICON}\e[90m${ICON}\033[1;37m${ICON}\e[37m${ICON}\e[90m${ICON} "
  "    \e[90m${ICON}\e[90m${ICON}\e[37m${ICON}\033[1;37m${ICON}\e[90m${ICON}"
)

function animation() {

  case $1 in

    start )

      let column=$(echo $COLUMNS)-${#2}-8

      printf "%${column}s"

      while true; do
        for i in {0..4}; do
          printf "\b\r\033[2K${COLOR_DEFAULT}${2} ${ARRAY_ANIMATION[i]}"
          sleep 0.12
        done
        for i in {4..0}; do
          printf "\b\r\033[2K${COLOR_DEFAULT}${2} ${ARRAY_ANIMATION[i]}"
          sleep 0.12
        done
      done

    ;;

    stop )

      if [[ -z ${3} ]]; then
        echo "Animation not running"
        exit 1
      fi

      kill ${3} > /dev/null 2>&1

      echo -en "\b${COLOR_DEFAULT}  --> ["

      if [[ $2 -eq 0 ]]; then
        echo -en " ${COLOR_GREEN}${OK}${COLOR_DEFAULT} "
      else
        echo -en " ${COLOR_RED}${NO}${COLOR_DEFAULT} "
      fi

      echo -e "${COLOR_DEFAULT}]"

    ;;

    * )

      echo "invalid argument, try again with {start/stop}"
      exit 1

    ;;

  esac
}

function start_animation() {

  setCursor off
  animation "start" "${1}" &
  animation_pid=${!}
  disown

}

function stop_animation() {

  animation "stop" $1 $animation_pid
  unset $animation_pid
  setCursor on

}
