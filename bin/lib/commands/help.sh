# shellcheck shell=bash
#
# Localhost SonarQube help command.

#######################################
# Display the Localhost SonarQube
# help information.
#
# Globals:
#   APP_COMMAND
#
# Arguments:
#   User input
#
# Outputs:
#   Writes help information to stdout.
#
# Returns:
#   1 if command is not supported.
#######################################
function command::help() {
  if [ $# == 0 ]; then
    explain::command_help

    exit 0
  fi

  local explain_command="explain::command_${1//-/_}"

  if [[ $( type -t "${explain_command}" ) != function ]]; then
    console::error --margin-bottom \
      "Command $(ansi --bold --white "${1}" ) is not supported."

    console::output \
      "To view a list of all available commands use the following:" \
      "$(ansi --bold --white "${APP_COMMAND} --help")"

    exit 1
  fi

  # Execute the explain command.
  "${explain_command}"
}
