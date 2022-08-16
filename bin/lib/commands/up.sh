# shellcheck shell=bash
#
# Localhost SonarQube up command.

#######################################
# Start SonarQube Docker containers.
#
# Globals:
#   DOCKER_COMPOSE_FILE
#   DOCKER_PROJECT_NAME
#
# Outputs:
#   Writes status message to stdout.
#######################################
function command::up() {
  docker_compose::command \
    --project_name="${DOCKER_PROJECT_NAME}" \
    --file="${DOCKER_COMPOSE_FILE}" \
    up --detach

  console::newline
  sonarqube::status
}
