# shellcheck shell=bash
#
# Internal Docker functions used by the sonarqube commands.

#######################################
# Check if docker is running on machine.
#
# Globals:
#   WHITE
#   NC
#
# Outputs:
#   Writes message to stdout.
#
# Returns:
#   1 if Docker is not running.
#######################################
function is_docker_running() {
  if ! docker info > /dev/null 2>&1; then
    output "${WHITE}Docker is not running. Please run Docker desktop.${NC}"

    exit 1
  fi
}

#######################################
# Check if SonarQube Docker containers are running.
#
# Returns:
#   0 if SonarQube Docker Container is not running.
#   1 if SonarQube Docker Container is running.
#######################################
function is_sonarqube_docker_containers_running() {
  if [ "$(docker ps -q -f name=sonarqube)" ]; then
    return 1
  fi

  return 0
}

#######################################
# Execute Docker compose CLI command.
#
# Arguments:
#   Docker compose file
#   Docker compose command
#   Docker compose command flags
#######################################
function run_docker_compose() {
  docker-compose -f "$@"
}

#######################################
# Scan Projet using SonarScanner in a Docker container.
#
# Arguments:
#   SonarScanner Docker image
#   Docker network
#######################################
function scan_project() {
  docker run \
    --network="${2}" \
    -it --rm \
    -v "$(pwd):/usr/src" \
    "${1}"
}
