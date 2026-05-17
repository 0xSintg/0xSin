# 0xSin ZSH Theme
# Prompt style: ┌─[root@0xSin]─[~]
#               └─»»»

autoload -U colors && colors

# Git prompt info
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[white]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[white]%})"

# Colors
_gray="%{\e[90m%}"
_lgray="%{\033[1;37m%}"
_green="%{$fg_bold[green]%}"
_red="%{$fg_bold[red]%}"
_white="%{\033[1;37m%}"
_dim="%{\e[37m%}"
_reset="%{$reset_color%}"

# Status indicator (green arrow on success, red on fail)
_ret_status="%(?:${_green}:${_red})»»»${_reset}"

PROMPT='${_gray}┌─[${_reset}${_lgray}%n${_reset}${_gray}@${_reset}${_white}0xSin${_reset}${_gray}]─[${_reset}${_dim}%~${_reset}${_gray}]${_reset} $(git_prompt_info)
${_gray}└─${_reset}${_ret_status} '

RPROMPT=''
