# shellcheck shell=bash
#
# SonarQube dashboard shell command

#######################################
# Open SonarQube dashboard in the browser.
#
# Globals:
#   SONARQUBE_DASHBOARD_URL
#
# Returns:
#   1 if SonarQube Docker Container is not running.
#######################################
function command::dashboard() {
  if docker::is_container_running sonarqube; then
    info "Opening SonarQube dashboard on $(ansi --bold --white "${SONARQUBE_DASHBOARD_URL}")"
    open_browser "${SONARQUBE_DASHBOARD_URL}"
  else
    warning "SonarQube is not running."
    info "Use the following commands: $(ansi --bold --white sonarqube up)."

    exit 1
  fi
}
