# shellcheck shell=bash
#
# Localhost SonarQube internal explain helper functions.

#######################################
# Display helpful information for
# the down command.
#
# Globals:
#   APP_COMMAND
#   GIT_REPOSITORY
#
# Outputs:
#   Writes helpful information to
#   stdout.
#######################################
function explain::command_down() {
  local helpful_tips=(
    "To stop and remove SonarQube containers, network:"
    "${APP_COMMAND} down"

    "Alternatively, you can use the stop command:"
    "${APP_COMMAND} stop"
  )

  explain::display_description "Stop SonarQube Docker containers."

  explain::display_usage "down"

  explain::display_helpful_tips "${helpful_tips[@]}"

  explain::display_more_information "${GIT_REPOSITORY}#down-command"
}
