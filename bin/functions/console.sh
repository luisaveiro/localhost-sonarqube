# shellcheck shell=bash
#
# Internal console functions used by the sonarqube commands.

#######################################
# Open SonarQube dashboard in the browser.
#
# Arguments:
#   Url
#######################################
function open_sonarqube_dashboard() {
  open "$1"
}

#######################################
# Output message to terminal.
#
# Arguments:
#   Message
#
# Outputs:
#   Writes message to stdout.
#######################################
function output() {
  echo -e "$1"
}
