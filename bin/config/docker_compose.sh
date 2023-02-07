# shellcheck shell=bash
#
# Define Localhost SonarQube global Docker Compose constants.

#######################################
# Docker Compose File
#######################################

readonly DOCKER_COMPOSE_FILE="${DOCKER_DIR}/compose.yaml"
export DOCKER_COMPOSE_FILE

#######################################
# Docker Project Name
#######################################

readonly DOCKER_PROJECT_NAME="sonarqube"
export DOCKER_PROJECT_NAME
