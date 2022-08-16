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
#   Writes Docker Compose config
#   to stdout.
#######################################
function command::config() {
  docker_compose::command \
    --project_name="${DOCKER_PROJECT_NAME}" \
    --file="${DOCKER_COMPOSE_FILE}" \
    config "$@"
}
