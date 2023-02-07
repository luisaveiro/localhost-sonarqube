# shellcheck shell=bash
#
# Localhost SonarQube dashboard command.

#######################################
# Open SonarQube dashboard in the
# browser.
#
# Globals:
#   APP_COMMAND
#   SONARQUBE_DASHBOARD_URL
#
# Outputs:
#   Writes messages to stdout.
#
# Returns:
#   1 if SonarQube is not running.
#######################################
function command::dashboard() {
  if ! sonarqube::is_running; then
    console::error --margin-bottom "SonarQube is not running!"

    console::output \
      "Please start SonarQube before attempting to access the dashboard." \
      "Use the following command: $(ansi --bold --white "${APP_COMMAND} up")."

    exit 1
  fi

  console::info \
    "Opening SonarQube dashboard on:" \
    "$(ansi --bold --white "${SONARQUBE_DASHBOARD_URL}")."

  browser::open "${SONARQUBE_DASHBOARD_URL}"
}

#######################################
# Display the helpful information for
# the dashboard command.
#
# Globals:
#   APP_COMMAND
#   GIT_REPOSITORY
#
# Outputs:
#   Writes messages to stdout.
#######################################
function explain::dashboard() {
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
