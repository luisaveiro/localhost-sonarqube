# shellcheck shell=bash
#
# Localhost SonarQube internal explain helper functions.

#######################################
# Display helpful information for
# the up command.
#
# Globals:
#   APP_COMMAND
#   GIT_REPOSITORY
#
# Outputs:
#   Writes helpful information to
#   stdout.
#######################################
function explain::command_up() {
  local helpful_tips=(
    "To start and create SonarQube containers, network:"
    "${APP_COMMAND} up"

    "Alternatively, you can use the start command:"
    "${APP_COMMAND} start"
  )

  explain::display_description "Stop SonarQube Docker containers."
  explain::display_usage "up"
  explain::display_helpful_tips "${helpful_tips[@]}"
  explain::display_more_information "${GIT_REPOSITORY}#up-command"
}
