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
#   1 if the command is not supported.
#######################################
function command::help() {
  if [ $# == 0 ]; then
    explain::command_help

    exit 0
  fi

  local explain_command="explain::${1//-/_}"

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

#######################################
# Display helpful information for
# the help command.
#
# Globals:
#   APP_COMMAND
#   GIT_REPOSITORY
#
# Outputs:
#   Writes helpful information to
#   stdout.
#######################################
function explain::help() {
  local arguments=(
    "command-name" "The command name $(ansi --yellow "[default: \"help\"]")."
  )

  local helpful_tips=(
    "The help command displays help for a given command:"
    "${APP_COMMAND} help publish"
  )

  explain::display_description "Display help for a command."

  explain::display_usage "help [<command-name>]"

  explain::display_arguments "${arguments[@]}"

  explain::display_helpful_tips "${helpful_tips[@]}"

  explain::display_more_information "${GIT_REPOSITORY}#help-command"
}
