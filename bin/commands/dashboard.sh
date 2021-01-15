# shellcheck shell=bash
#
# SonarQube dashboard shell command

#######################################
# Open SonarQube dashboard in the browser.
#
# Globals:
#   SONARQUBE_DASHBOARD_URL
#   WHITE
#   NC
#
# Outputs:
#   Writes message to stdout.
#
# Returns:
#   1 if SonarQube Docker Container is not running.
#######################################
function command::dashboard() {
  if ! is_sonarqube_docker_containers_running; then
    output "Opening SonarQube dashboard on ${WHITE}${SONARQUBE_DASHBOARD_URL}.${NC}"
    open_sonarqube_dashboard "${SONARQUBE_DASHBOARD_URL}"
  else
    output "${WHITE}SonarQube is not running.${NC}"
    output "Use the following commands: ${WHITE}sonarqube up${NC}."

    exit 1
  fi
}
