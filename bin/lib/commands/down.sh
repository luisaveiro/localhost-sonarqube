# shellcheck shell=bash
#
# Localhost SonarQube down command.

#######################################
# Start SonarQube Docker containers.
#
# Globals:
#   DOCKER_COMPOSE_FILE
#   DOCKER_PROJECT_NAME
#   DOTENV
#
# Outputs:
#   Writes messages to stdout.
#######################################
function command::down() {
  docker_compose::command \
    --env_file="${DOTENV}" \
    --project_name="${DOCKER_PROJECT_NAME}" \
    --file="${DOCKER_COMPOSE_FILE}" \
    down

  console::newline
  sonarqube::status
}

#######################################
# Display the helpful information for
# the down command.
#
# Globals:
#   APP_COMMAND
#   GIT_REPOSITORY
#
# Outputs:
#   Writes messages to stdout.
#######################################
function explain::down() {
  local helpful_tips=(
    "To stop and remove SonarQube containers, network:"
    "${APP_COMMAND} down"

    "Alternatively, you can use the stop command:"
    "${APP_COMMAND} stop"
  )

  explain::display_description "Stop SonarQube Docker containers."

  explain::display_usage "down"

  explain::display_helpful_tips "${helpful_tips[@]}"

  explain::display_more_information "${GIT_REPOSITORY}#down-command"
}
