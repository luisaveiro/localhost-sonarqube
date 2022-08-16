# shellcheck shell=bash
#
# Localhost SonarQube internal sonarscanner service functions.

#######################################
# Check SonarScanner is running.
#
# Returns:
#   0 if SonarScanner is running.
#   1 if SonarScanner is not running.
#######################################
function sonarscanner::is_running() {
  docker::is_container_running sonarscanner && return 0 || return 1
}

#######################################
# Output status message of SonarScanner
# container.
#
# Globals:
#   APP_COMMAND
#
# Outputs:
#   Writes status message to stdout.
#######################################
function sonarscanner::status() {
  local volume

  if sonarscanner::is_running; then
    console::info --margin-bottom "SonarScanner is running!"

    volume="$(docker::container_mounted_volume sonarscanner)"

    console::output \
      "SonarScanner is current scanning: $(ansi --bold --white "${volume}")"
  else
    console::warning --margin-bottom "SonarScanner is not running!"

    console::output \
      "To scan a project use the following command:" \
      "$(ansi --bold --white "${APP_COMMAND} scan")."
  fi
}
