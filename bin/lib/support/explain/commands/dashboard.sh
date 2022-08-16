# shellcheck shell=bash
#
# Localhost SonarQube internal explain helper functions.

#######################################
# Display helpful information for
# the dashboard command.
#
# Globals:
#   APP_COMMAND
#   GIT_REPOSITORY
#
# Outputs:
#   Writes helpful information to
#   stdout.
#######################################
function explain::command_dashboard() {
  local helpful_tips=(
    "To display the status and open the dashboard in your default browser:"
    "${APP_COMMAND} dashboard"
  )

  explain::display_description \
    "Open SonarQube dashboard in your default browser."

  explain::display_usage "dashboard"

  explain::display_helpful_tips "${helpful_tips[@]}"

  explain::display_more_information "${GIT_REPOSITORY}#dashboard-command"
}
