# shellcheck shell=bash
#
# Internal file system functions used by the sonarqube commands.

#######################################
# Check if requested configuration template exists.
#
# Arguments:
#   Properties file name
#
# Returns:
#   0 if SonarQube Docker Container is not running.
#   1 if SonarQube Docker Container is running.
#######################################
function configuration_template_exists() {
  if [ -f "${1}" ]; then
    return 1
  fi

  return 0
}

#######################################
# Check if properties file exist in current directory.
#
# Arguments:
#   Properties file
#
# Returns:
#   0 if properties file exists.
#   1 if properties file does not exists.
#######################################
function project_configuration_exists() {
  if [ -f "$(pwd)/${1}" ]; then
    return 1
  fi

  return 0
}

#######################################
# Copy SonarScanner properties file to a project directory.
#
# Arguments:
#   Properties template file name
#   Destination of copied properties template
#######################################
function publish_configuration() {
  cp "${1}" "${2}"
}
