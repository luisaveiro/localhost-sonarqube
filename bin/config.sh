# shellcheck shell=bash
#
# Define global constants.

readonly PROJECT_DIR=$(dirname "${CURRENT_DIR}")

# Docker compose
export readonly DOCKER_COMPOSE_FILE="${PROJECT_DIR}/docker/docker-compose.yml"

# SonarScanner template
export readonly TEMPLATE_DIR="${PROJECT_DIR}/sonarscanner-templates"
export readonly PROPERTIES_FILE="sonar-project.properties"

# SonarQube
export readonly SONARQUBE_DASHBOARD_URL="http://localhost:9000"
export readonly SONARSCANNER_DOCKER_NETWORK="sonarqube-network"
export readonly SONARSCANNER_DOCKER_IMAGE="sonarsource/sonar-scanner-cli:latest"

export PROJECT_DIR
