#!/usr/bin/env bash

# 0xSin Color System
# Primary  : Gray   — backgrounds, borders, separators
# Secondary: Cyan   — interactive elements, prompts, highlights
# Alert    : Yellow — warnings, notifications, alerts

COLOR_BASED="\e[39m"
COLOR_RESET="\033[0m"
COLOR_DEFAULT="\e[39m"

# Semantic roles
COLOR_DANGER="\e[91m"
COLOR_WARNING="\e[93m"       # Yellow — alerts
COLOR_SUCCESS="\e[92m"

# Gray (Primary)
COLOR_GRAY="\e[37m"
COLOR_LIGHT_GRAY="\e[37m"
COLOR_DARK_GRAY="\e[90m"
COLOR_BOLD_GRAY="\033[1;37m"
COLOR_BOLD_WHITE="\033[1;97m"
COLOR_WHITE="\e[97m"
COLOR_BLACK="\e[30m"

# Cyan (Secondary — interactive)
COLOR_CYAN="\e[36m"
COLOR_LIGHT_CYAN="\e[96m"
COLOR_BOLD_CYAN="\033[1;36m"
COLOR_SKY="\e[96m"

# Yellow (Alert/Notification)
COLOR_YELLOW="\e[33m"
COLOR_LIGHT_YELLOW="\e[93m"
COLOR_BOLD_YELLOW="\033[1;33m"

# Supporting
COLOR_RED="\e[31m"
COLOR_GREEN="\e[32m"
COLOR_BLUE="\e[34m"
COLOR_MAGENTA="\e[35m"
COLOR_LIGHT_RED="\e[91m"
COLOR_LIGHT_GREEN="\e[92m"
COLOR_LIGHT_BLUE="\e[94m"
COLOR_LIGHT_MAGENTA="\e[95m"
COLOR_BOLD_MAGENTA="\033[1;35m"
COLOR_BOLD_GREEN="\033[1;32m"
COLOR_BOLD_BLUE="\033[1;34m"
COLOR_BOLD_RED="\033[1;31m"

# Accent aliases
COLOR_ACCENT="\033[1;36m"       # Cyan — primary interactive
COLOR_ACCENT_DIM="\e[36m"
COLOR_ACCENT_DARK="\e[90m"
COLOR_ALERT="\033[1;33m"        # Yellow — alerts
COLOR_BORDER="\e[90m"           # Gray  — separators/borders

COLOR_BACKGROUND_YELLOW="\033[1;43;33m"
COLOR_BACKGROUND_WHITE="\033[1;47;37m"
COLOR_BACKGROUND_BLACK="\033[1;40;30m"
