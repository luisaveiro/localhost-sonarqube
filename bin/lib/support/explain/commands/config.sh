# shellcheck shell=bash
#
# Localhost SonarQube internal explain helper functions.

#######################################
# Display helpful information for
# the config command.
#
# Globals:
#   APP_COMMAND
#   APP_NAME
#   GIT_REPOSITORY
#
# Outputs:
#   Writes helpful information to
#   stdout.
#######################################
function explain::command_config() {
  local helpful_tips=(
    "To validate and view the Docker Compose file:"
    "${APP_COMMAND} config"
  )

  local options=(
    "--services" "Print the service names, one per line."
    "--volumes" "Print the volume names, one per line."
  )

  explain::display_description \
    "Display ${APP_NAME} Docker Compose config."

  explain::display_usage "config [options]"

  explain::display_options "${options[@]}"

  explain::display_helpful_tips "${helpful_tips[@]}"

  explain::display_more_information "${GIT_REPOSITORY}#config-command"
}
