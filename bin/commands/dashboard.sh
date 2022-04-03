# shellcheck shell=bash
#
# SonarQube dashboard shell command

#######################################
# Open SonarQube dashboard in the browser.
#
# Arguments:
#   url
#
# Returns:
#   1 if SonarQube Docker Container is not running.
#######################################
function command::dashboard() {
  local url=$1

  if docker::is_container_running sonarqube; then
    info "Opening SonarQube dashboard on $(ansi --bold --white "${url}")"
    open_browser "${url}"
  else
    warning "SonarQube is not running!"
    output "To start SonarQube use the following command:" \
      "$(ansi --bold --white sonarqube up)."

    exit 1
  fi
}
