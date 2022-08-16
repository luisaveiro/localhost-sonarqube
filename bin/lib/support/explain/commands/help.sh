# shellcheck shell=bash
#
# Localhost SonarQube internal explain helper functions.

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
function explain::command_help() {
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
