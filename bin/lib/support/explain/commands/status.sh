# shellcheck shell=bash
#
# Localhost SonarQube internal explain helper functions.

#######################################
# Display helpful information for
# the status command.
#
# Globals:
#   APP_COMMAND
#   GIT_REPOSITORY
#
# Outputs:
#   Writes helpful information to
#   stdout.
#######################################
function explain::command_status() {
  local helpful_tips=(
    "Display the running status of the SonarQube & SonarScanner containers:"
    "${APP_COMMAND} status"
  )

  explain::display_description \
    "Get the current status of SonarQube & SonarScanner containers."

  explain::display_usage "status"

  explain::display_helpful_tips "${helpful_tips[@]}"

  explain::display_more_information "${GIT_REPOSITORY}#status-command"
}
