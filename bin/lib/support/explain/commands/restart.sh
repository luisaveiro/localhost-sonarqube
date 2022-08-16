# shellcheck shell=bash
#
# Localhost SonarQube internal explain helper functions.

#######################################
# Display helpful information for
# the restart command.
#
# Globals:
#   APP_COMMAND
#   GIT_REPOSITORY
#
# Outputs:
#   Writes helpful information to
#   stdout.
#######################################
function explain::command_restart() {
  local helpful_tips=(
    "To restart SonarQube containers:"
    "${APP_COMMAND} restart"
  )

  explain::display_description "Restart SonarQube Docker containers."

  explain::display_usage "restart"

  explain::display_helpful_tips "${helpful_tips[@]}"

  explain::display_more_information "${GIT_REPOSITORY}#restart-command"
}
