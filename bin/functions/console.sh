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
#   --newline
#   Message
#
# Outputs:
#   Writes message to stdout.
#######################################
function output() {
  local text newlines=() messages

  messages=$*

  while [ $# -gt 0 ]; do
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

  if [[ ${newlines[*]} =~ "top" ]]; then
    newline
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
