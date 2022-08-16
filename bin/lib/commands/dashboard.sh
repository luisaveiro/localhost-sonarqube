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
