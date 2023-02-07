# shellcheck shell=bash
#
# Localhost SonarQube restart command.

#######################################
# Restart SonarQube Docker containers.
#
# Globals:
#   DOCKER_COMPOSE_FILE
#   DOCKER_PROJECT_NAME
#
# Outputs:
#   Writes messages to stdout.
#######################################
function command::restart() {
  docker_compose::command \
    --project_name="${DOCKER_PROJECT_NAME}" \
    --file="${DOCKER_COMPOSE_FILE}" \
    restart

  console::newline
  sonarqube::status
}

#######################################
# Display the helpful information for
# the restart command.
#
# Globals:
#   APP_COMMAND
#   GIT_REPOSITORY
#
# Outputs:
#   Writes messages to stdout.
#######################################
function explain::restart() {
  local helpful_tips=(
    "To restart SonarQube containers:"
    "${APP_COMMAND} restart"
  )

  explain::display_description "Restart SonarQube Docker containers."

  explain::display_usage "restart"

  explain::display_helpful_tips "${helpful_tips[@]}"

  explain::display_more_information "${GIT_REPOSITORY}#restart-command"
}
