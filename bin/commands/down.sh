# shellcheck shell=bash
#
# SonarQube down shell command

#######################################
# Stop SonarQube Docker containers.
#
# Globals:
#   DOCKER_COMPOSE_FILE
#######################################
function command::down() {
  run_docker_compose "${DOCKER_COMPOSE_FILE}" down
}
