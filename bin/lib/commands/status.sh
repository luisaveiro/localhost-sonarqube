# shellcheck shell=bash
#
# Localhost SonarQube status command.

#######################################
# Display the Localhost SonarQube
# status information.
#
# Outputs:
#   Writes status information stdout.
#######################################
function command::status() {
  sonarqube::status
  console::newline
  sonarscanner::status
}
