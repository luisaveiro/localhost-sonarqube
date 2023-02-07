# shellcheck shell=bash
#
# Localhost SonarQube status command.

#######################################
# Display the Localhost SonarQube
# status information.
#
# Outputs:
#   Writes messages to stdout.
#######################################
function command::status() {
  sonarqube::status
  console::newline
  sonarscanner::status
}

#######################################
# Display the helpful information for
# the status command.
#
# Globals:
#   APP_COMMAND
#   GIT_REPOSITORY
#
# Outputs:
#   Writes messages to stdout.
#######################################
function explain::status() {
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
