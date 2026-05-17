#!/usr/bin/env bash

function screenSize() {

  REQUIRE_COLS=101
  REQUIRE_ROWS=39

  CURRENT_COLS=$(echo $COLUMNS)
  CURRENT_ROWS=$(echo $LINES)

  if [[ -n ${CURRENT_COLS} && -n ${CURRENT_ROWS} ]]; then

    if (( ${CURRENT_COLS} >= ${REQUIRE_COLS} & ${CURRENT_ROWS} >= ${REQUIRE_ROWS} )); then

      ${1}

    else

      stat "INFO" "Warning" "Screen size too small
               Columns: '${COLOR_WARNING}${CURRENT_COLS}${COLOR_BASED}'
               Lines  : '${COLOR_WARNING}${CURRENT_ROWS}${COLOR_BASED}'
      "

      stat "INFO" "Success" "Required size
               Columns: '${COLOR_SUCCESS}${REQUIRE_COLS}${COLOR_BASED}'
               Lines  : '${COLOR_SUCCESS}${REQUIRE_ROWS}${COLOR_BASED}'
      "

      stat "ERROR" "Danger" "Please zoom out your terminal then run again."

    fi

  else

    stat "INFO" "Warning" "Cannot read '${COLOR_WARNING}COLUMNS${COLOR_BASED}' and '${COLOR_WARNING}LINES${COLOR_BASED}' variables."

    stat "ERROR" "Danger" "Run '${COLOR_WARNING}export COLUMNS LINES${COLOR_BASED}' first, then run again."

  fi

}
