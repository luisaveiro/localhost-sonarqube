# shellcheck shell=bash
#
# Internal console functions used by the sonarqube commands.

#######################################
# Output error message to terminal.
#
# Arguments:
#   Message
#######################################
function error() {
  output "$(ansi --red ERROR:)" "$@"
}

#######################################
# Output info message to terminal.
#
# Arguments:
#   Message
#######################################
function info() {
  output "$(ansi --color=33 INFO:)" "$@"
}

#######################################
# Output a new line to terminal.
#######################################
function newline() {
  echo -e ""
}

#######################################
# Output notice message to terminal.
#
# Arguments:
#   Message
#######################################
function notice() {
  output "$(ansi --white --bold NOTICE:)" "$@"
}

#######################################
# Open url in the browser.
#
# Arguments:
#   Url
#######################################
function open_browser() {
  open "$1"
}

#######################################
# Output message to terminal.
#
# Arguments:
#   --overwrite
#   --newline
#   Message
#
# Outputs:
#   Writes message to stdout.
#######################################
function output() {
  local text overwrite newlines=() messages

  messages=$*

  while [ $# -gt 0 ]; do
    if [[ $1 == *"--overwrite"* ]]; then
      overwrite="\r\033[1A\033[0K"
      messages="${messages/--overwrite/}"
    fi

    if [[ $1 == *"--newline="* ]]; then
      local argument="${1/--/}"
      messages="${messages/--${argument}/}"

      IFS='=' read -ra parameter <<< "${argument}"
      newlines+=("${parameter[1]}")
    fi

    shift
  done

  IFS=' ' read -ra messages <<< "${messages}"
  text="${messages[*]}"

  if [[ ${newlines[*]} =~ "top" && -n $overwrite ]]; then
    echo -e "${overwrite}"
  elif [[ ${newlines[*]} =~ "top" ]]; then
    newline
  elif [[  -n $overwrite ]]; then
    text="${overwrite}${text}"
  fi

  echo -e "${text}"

  if [[ ${newlines[*]} =~ "bottom" ]]; then
    newline
  fi
}


#######################################
# Output warning message to terminal.
#
# Arguments:
#   Message
#######################################
function warning() {
  output "$(ansi --yellow WARNING:)" "$@"
}
