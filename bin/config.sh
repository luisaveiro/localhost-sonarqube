# shellcheck shell=bash
#
# Define global constants.

export readonly WHITE='\033[1;37m'
export readonly NC='\033[0m'
export readonly DOCKER_COMPOSE_FILE="${CURRENT_DIR}/../docker/docker-compose.yml"
export readonly PROPERTIES_FILE="sonar-project.properties"
export readonly SONARQUBE_DASHBOARD_URL="http://localhost:9000"
export readonly SONARSCANNER_DOCKER_NETWORK="sonarqube-network"
export readonly SONARSCANNER_DOCKER_IMAGE="sonarsource/sonar-scanner-cli:latest"
