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
#   Writes status message to stdout.
#######################################
function command::restart() {
  docker_compose::command \
    --project_name="${DOCKER_PROJECT_NAME}" \
    --file="${DOCKER_COMPOSE_FILE}" \
    restart

  console::newline
  sonarqube::status
}
