# shellcheck shell=bash
#
# Localhost SonarQube internal console messaging functions.

#######################################
# Output the error message.
#
# Arguments:
#   Message
#
# Outputs:
#   Writes message to stdout.
#######################################
function console::error() {
  console::output "$(ansi --bold --white --bg-red ERROR:)" "$@"
}

#######################################
# Output the info message.
#
# Arguments:
#   Message
#
# Outputs:
#   Writes message to stdout.
#######################################
function console::info() {
  console::output "$(ansi --bold --white --bg-color=33 INFO:)" "$@"
}

#######################################
# Output a new line.
#
# Outputs:
#   Writes blank line to stdout.
#######################################
function console::newline() {
  echo -e ""
}

#######################################
# Output the notice message.
#
# Arguments:
#   Message
#
# Outputs:
#   Writes message to stdout.
#######################################
function console::notice() {
  console::output "$(ansi --bold --black --bg-white NOTICE:)" "$@"
}

#######################################
# Output the message.
#
# Arguments:
#   Message
#
# Outputs:
#   Writes message to stdout.
#######################################
function console::output() {
  local arguments_list=("margin-bottom" "margin-top" "overwrite")
  local margin_bottom=false
  local margin_top=false
  local message="${*}"
  local overwrite=false

  while [ $# -gt 0 ]; do
    if [[ $1 == *"--"* ]]; then
      local argument="${1/--/}"

      if [[ "${arguments_list[*]}" =~ ${argument} ]]; then
        message="${message/--${argument}[[:blank:]]/}"
        declare "${argument//-/_}"=true
      fi
    fi

    shift
  done

  if [[ "${margin_top}" == true ]]; then
    console::newline
  fi

  if [[ "${overwrite}" == true ]]; then
    echo -e "\r\033[1A\033[0K${message}"
  else
    echo -e "${message}"
  fi

  if [[ "${margin_bottom}" == true ]]; then
    console::newline
  fi
}

#######################################
# Output the warning message.
#
# Arguments:
#   Message
#
# Outputs:
#   Writes message to stdout.
#######################################
function console::warning() {
  console::output "$(ansi --bold --black --bg-yellow WARNING:)" "$@"
}
