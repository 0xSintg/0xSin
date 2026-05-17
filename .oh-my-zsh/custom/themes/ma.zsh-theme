# 0xSin ZSH Theme

autoload -U colors && colors

ZSH_THEME_GIT_PROMPT_PREFIX="%F{white}git:(%F{red}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f "
ZSH_THEME_GIT_PROMPT_DIRTY="%F{white}) %F{yellow}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{white})"

PROMPT='%F{240}┌─[%f%B%F{white}%n%f%b%F{240}@%f%B%F{white}0xSin%f%b%F{240}]─[%f%F{245}%~%f%F{240}]%f$(git_prompt_info)
%F{240}└─%f%(?.%F{white}.%F{red})»»»%f '

RPROMPT=''
