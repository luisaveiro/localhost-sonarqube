# shellcheck shell=bash
#
# Localhost SonarQube down command.

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
function command::down() {
  docker_compose::command \
    --project_name="${DOCKER_PROJECT_NAME}" \
    --file="${DOCKER_COMPOSE_FILE}" \
    down

  console::newline
  sonarqube::status
}
