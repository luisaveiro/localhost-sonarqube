# shellcheck shell=bash
#
# Localhost SonarQube usage command.

#######################################
# Display the Localhost SonarQube
# usage options.
#
# Global:
#   APP_COMMAND
#   GIT_REPOSITORY
#
# Arguments:
#   User input
#
# Outputs:
#   Writes usage options to stdout.
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
    --has_arguments \
    --has_options

  help::display_commands

  help::display_useful_tips \
    --command_name="${APP_COMMAND}"
}