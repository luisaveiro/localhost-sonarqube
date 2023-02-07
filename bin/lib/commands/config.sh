# shellcheck shell=bash
#
# Localhost SonarQube config command.

#######################################
# Display Localhost SonarQube Docker
# Compose config.
#
# Globals:
#   DOCKER_COMPOSE_FILE
#   DOCKER_PROJECT_NAME
#
# Arguments:
#   User input
#
# Outputs:
#   Writes messages to stdout.
#######################################
function command::config() {
  docker_compose::command \
    --project_name="${DOCKER_PROJECT_NAME}" \
    --file="${DOCKER_COMPOSE_FILE}" \
    config "$@"
}

#######################################
# Display the helpful information for
# the config command.
#
# Globals:
#   APP_COMMAND
#   APP_NAME
#   GIT_REPOSITORY
#
#   Writes messages to stdout.
#######################################
function explain::config() {
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
