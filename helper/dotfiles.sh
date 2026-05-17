#!/usr/bin/env bash

BACKUP_DOTFILES=(
  .autostart .aliases
  .config .colorscheme
  .fonts .local .scripts
  .termux .tmux.conf
  .zshrc .oh-my-zsh
)

DOTFILES=(
  .autostart .aliases
  .config .colorscheme
  .fonts .local .scripts
  .termux .tmux.conf
  .zshrc
)

function dotFiles() {

  setCursor off

  local gray="\033[1;37m"
  local dark="\e[90m"
  local reset="\033[0m"

  echo -e "\n  Getting Dotfiles Info\n"
  sleep 2s

  echo -e "${dark}  ──────────────────────────────────────────${reset}"
  echo -e "  ${gray}  Dotfiles${reset}"
  echo -e "${dark}  ──────────────────────────────────────────${reset}"
  printf "    ${dark}%-24s  %-10s${reset}\n" "Name" "Size"
  echo -e "${dark}  ──────────────────────────────────────────${reset}\n"

  for DOTFILE in "${DOTFILES[@]}"; do
    FOLDER_SIZE=$(du -s -h $DOTFILE | awk '{print $1}')
    printf "    ${COLOR_SUCCESS}%-24s${COLOR_BASED}  ${COLOR_WARNING}%5s${COLOR_BASED}\n" $DOTFILE $FOLDER_SIZE
  done

  echo -e "\n${dark}  ──────────────────────────────────────────${reset}\n"

}

function backupDotFiles() {

  echo -e "  Backup Dotfiles\n"
  sleep 2s

  for BACKUP_DOTFILE in "${BACKUP_DOTFILES[@]}"; do

    start_animation "       Backup ${COLOR_WARNING}'${COLOR_SUCCESS}${BACKUP_DOTFILE}${COLOR_WARNING}'${COLOR_BASED} ..."
    sleep 1s

    if [[ -d "$HOME/$BACKUP_DOTFILE" || -f "$HOME/$BACKUP_DOTFILE" ]]; then
      mv ${HOME}/${BACKUP_DOTFILE} ${HOME}/${BACKUP_DOTFILE}.$(date +%Y.%m.%d-%H.%M.%S).backup
      if [[ -d ${HOME}/${BACKUP_DOTFILE}.$(date +%Y.%m.%d-%H.%M.%S).backup || -f ${HOME}/${BACKUP_DOTFILE}.$(date +%Y.%m.%d-%H.%M.%S).backup ]]; then
        stop_animation $? || exit 1
      else
        stop_animation $?
      fi
    else
      stop_animation $?
    fi

  done

  echo -e ""

}

function installDotFiles() {

  setCursor off

  echo -e "\n  Installing Dotfiles\n"

  for DOTFILE in "${DOTFILES[@]}"; do

    if [ "${DOTFILE}" == ".termux" ]; then
      start_animation "       Installing ${COLOR_WARNING}'${COLOR_SUCCESS}${DOTFILE}${COLOR_WARNING}'${COLOR_BASED} ..."
      cp -R $DOTFILE $HOME
      if [[ -d $HOME/$DOTFILE || -f $HOME/$DOTFILE ]]; then
        termux-reload-settings
        stop_animation $? || exit 1
      else
        stop_animation $?
      fi
    else
      start_animation "       Installing ${COLOR_WARNING}'${COLOR_SUCCESS}${DOTFILE}${COLOR_WARNING}'${COLOR_BASED} ..."
      cp -R $DOTFILE $HOME
      if [[ -d $HOME/$DOTFILE || -f $HOME/$DOTFILE ]]; then
        stop_animation $? || exit 1
      else
        stop_animation $?
      fi
    fi

  done

  echo -e ""
  setCursor on

}
