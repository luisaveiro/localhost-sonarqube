# shellcheck shell=bash
#
# SonarQube scan shell command

#######################################
# Scan project source code with SonarScanner.
#
# Globals:
#   PROPERTIES_FILE
#   WHITE
#   NC
#   SONARSCANNER_DOCKER_IMAGE
#   SONARSCANNER_DOCKER_NETWORK
#
# Outputs:
#   Writes message to stdout.
#
# Returns:
#   1 if properties file is missing in directory.
#######################################
function command::scan() {
  if project_configuration_exists "${PROPERTIES_FILE}"; then
    output "Add ${WHITE}${PROPERTIES_FILE}${NC} before running SonarScanner."
    output "Use the following commands: ${WHITE}sonarqube publish${NC} or ${WHITE}sonarqube publish <template>${NC}."

    exit 1
  fi

  scan_project "${SONARSCANNER_DOCKER_IMAGE}" "${SONARSCANNER_DOCKER_NETWORK}"
}
