# shellcheck shell=bash
#
# Localhost SonarQube internal console progressbar functions.

#######################################
# Clear the progressbar.
#######################################
function progressbar::clear() {
  echo -ne "\033[0K\r"
}

#######################################
# Output a 100% completed progressbar.
#
# Arguments:
#   --clear
#
# Outputs:
#   Writes completed progressbar
#   to stdout.
#######################################
function progressbar::finish() {
  local clear

  while [ $# -gt 0 ]; do
    if [[ "${1}" == *"--clear"* ]]; then
      clear=true
    fi

    shift
  done

  echo -ne '[==============================] 100%\r'

  if [[ "${clear}" == "true" ]]; then
    progressbar::clear
  fi
}

#######################################
# Output a 50% completed progressbar.
#
# Arguments:
#   sleep duration
#
# Outputs:
#   Writes 50% completed progressbar
#   to stdout.
#######################################
function progressbar::half() {
  echo -ne '[==============>---------------]  50%\r'
  sleep "${1:-1}"
}

#######################################
# Output a 0% completed progressbar.
#
# Arguments:
#   sleep duration
#
# Outputs:
#   Writes 0% completed progressbar
#   to stdout.
#######################################
function progressbar::start() {
  echo -ne '[>-----------------------------]   0%\r'
  sleep "${1:-1}"
}
