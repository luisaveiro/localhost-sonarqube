# shellcheck shell=bash
#
# Progress bar package.

#######################################
# Print progressbar with 0%
#
# Arguments:
#   sleep
#######################################
function progressbar::start() {
  echo -ne '[>-----------------------------]   0%\r'
  sleep "${1:-1}"
}

#######################################
# Print progressbar with 50%
#
# Arguments:
#   sleep
#######################################
function progressbar::half() {
  echo -ne '[==============>---------------]  50%\r'
  sleep "${1:-1}"
}

#######################################
# Print progressbar with 0%
#
# Arguments:
#   --clear
#######################################
function progressbar::finish() {
  local clear

  while [ $# -gt 0 ]; do
    if [[ $1 == *"--clear"* ]]; then
      clear=true
    fi

    shift
  done

  echo -ne '[==============================] 100%\r'

  if [[ "$clear" == "true" ]]; then
    progressbar::clear
  fi
}

#######################################
# Clear progressbar
#######################################
function progressbar::clear() {
  echo -ne "\033[0K\r"
}
