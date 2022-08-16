# shellcheck shell=bash
#
# Localhost SonarQube internal sonarqube service functions.

#######################################
# Check SonarQube is running.
#
# Returns:
#   0 if SonarQube is running.
#   1 if SonarQube is not running.
#######################################
function sonarqube::is_running() {
  docker::is_container_running sonarqube && return 0 || return 1
}

#######################################
# Output status message of SonarQube
# containers.
#
# Globals:
#   APP_COMMAND
#   SONARQUBE_DASHBOARD_URL
#
# Outputs:
#   Writes status message to stdout.
#######################################
function sonarqube::status() {
  if sonarqube::is_running; then
    console::info --margin-bottom \
      "SonarQube is running on:" \
      "$(ansi --bold --white "${SONARQUBE_DASHBOARD_URL}")."

    console::output \
      "To access SonarQube dashboard use the following command:" \
      "$(ansi --bold --white "${APP_COMMAND} dashboard")."
  else
    console::warning --margin-bottom \
      "SonarQube is not running!"

    console::output \
      "To start SonarQube use the following command:" \
      "$(ansi --bold --white "${APP_COMMAND} up")."
  fi
}
