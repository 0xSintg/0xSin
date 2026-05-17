#!/usr/bin/env bash

function NvChad() {

  echo -e "\n  Installing Neovim Config (NvChad)\n"

  stat "CHECK" "Warning" "'${COLOR_WARNING}NvChad${COLOR_BASED}' folder"

  if [ -d $HOME/NvChad ]; then

    stat "RESULT" "Success" "'${COLOR_SUCCESS}NvChad${COLOR_BASED}' found"
    stat "RUN"    "Warning" "Moving to '${COLOR_WARNING}.config/nvim${COLOR_BASED}' ..."

    mv $HOME/NvChad $HOME/.config/nvim

    if [ -d $HOME/.config/nvim ]; then

      stat "RESULT" "Success" "'${COLOR_SUCCESS}NvChad${COLOR_BASED}' moved to '${COLOR_SUCCESS}.config/nvim${COLOR_BASED}'"
      stat "RUN"    "Warning" "Launching '${COLOR_WARNING}NvChad${COLOR_BASED}' ..."

      nvim

    else

      stat "RESULT" "Danger" "'${COLOR_DANGER}NvChad${COLOR_BASED}' failed to move"

    fi

  else

    stat "RESULT" "Danger" "'${COLOR_DANGER}NvChad${COLOR_BASED}' directory not found"

  fi

}
