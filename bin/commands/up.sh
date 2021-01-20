# shellcheck shell=bash
#
# SonarQube up shell command

#######################################
# Start SonarQube Docker containers.
#
# Globals:
#   DOCKER_COMPOSE_FILE
#######################################
function command::up() {
  run_docker_compose "${DOCKER_COMPOSE_FILE}" up -d
}
