# shellcheck shell=bash
#
# Localhost SonarQube usage command.

#######################################
# Display the Localhost SonarQube
# usage options.
#
# Global:
#   APP_NAME
#   APP_COMMAND
#   GIT_REPOSITORY
#
# Outputs:
#   Writes messages to stdout.
#######################################
function command::usage() {
  local commands=(
    "about"
    "config"
    "dashboard"
    "docs"
    "down"
    "fund"
    "list"
    "port"
    "publish"
    "restart"
    "scan"
    "self-update"
    "status"
    "up"
    "version"
  )

  local descriptions=(
    "Shows a short information about ${APP_NAME}."
    "Display ${APP_NAME} Docker Compose config."
    "Open SonarQube dashboard in the browser."
    "Open ${APP_NAME} documentation in the browser."
    "Stop SonarQube Docker containers."
    "Display ${APP_NAME} funding information."
    "List available SonarScanner properties files."
    "Set the SonarQube dashboard port."
    "Publish SonarScanner properties file to a project directory."
    "Restart SonarQube Docker containers."
    "Scan project source code with SonarScanner."
    "Update ${APP_NAME} to the latest version."
    "Get the current status of SonarQube & SonarScanner containers."
    "Start SonarQube Docker containers."
    "Display ${APP_NAME} installed version."
  )

  for index in "${!commands[@]}"; do
    help::add_command \
      --command="${commands[index]}" \
      --description="${descriptions[index]}"
  done

  help::title "${APP_NAME}"

  help::tagline \
    "Analysing source code locally with SonarQube in a Docker environment."

  help::contribute \
    --package_name="${APP_NAME}" \
    --package_url="${GIT_REPOSITORY}"

  help::display_usage \
    --command_name="${APP_COMMAND}" \
    --has-arguments \
    --has-options

  help::display_commands

  help::display_useful_tips \
    --command_name="${APP_COMMAND}"
}

#######################################
# Display the helpful information for
# the usage command.
#
# Globals:
#   APP_COMMAND
#   GIT_REPOSITORY
#
# Outputs:
#   Writes messages to stdout.
#######################################
function explain::usage() {
  local helpful_tips=(
    "The usage command lists all commands:"
    "${APP_COMMAND} usage"

    "Alternatively, you can use sonarqube without providing commands:"
    "${APP_COMMAND}"
  )

  explain::display_description \
    "Display a list of all available commands."
  explain::display_usage "usage"
  explain::display_helpful_tips "${helpful_tips[@]}"
  explain::display_more_information "${GIT_REPOSITORY}#usage-command"
}
