# 0xSin ZSH Theme
# Prompt: ┌─[root@0xSin]─[~]
#         └─»»»
# Colors: Gray primary, Cyan secondary, Yellow alerts

autoload -U colors && colors

# Read saved prompt name (set during install or via chprompt)
_OXSIN_NAME_FILE="$HOME/.config/0xSin/prompt_name"
if [[ -f "${_OXSIN_NAME_FILE}" ]]; then
  _OXSIN_NAME="$(cat ${_OXSIN_NAME_FILE})"
else
  _OXSIN_NAME="0xSin"
fi

# Git prompt — cyan for clean, yellow for dirty
ZSH_THEME_GIT_PROMPT_PREFIX="%F{240}git:(%F{cyan}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f "
ZSH_THEME_GIT_PROMPT_DIRTY="%F{240}) %F{yellow}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{240})"

# Prompt
# Gray borders, cyan hostname, root hardcoded, yellow arrow on error
PROMPT='%F{240}┌─[%f%F{cyan}root%F{240}@%f%B%F{white}${_OXSIN_NAME}%b%F{240}]─[%f%F{245}%~%f%F{240}]%f$(git_prompt_info)
%F{240}└─%f%(?.%F{cyan}.%F{yellow})»»»%f '

RPROMPT=''
