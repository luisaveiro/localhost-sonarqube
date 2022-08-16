# shellcheck shell=bash
#
# Define Localhost SonarQube global filesystem constants.

#######################################
# Root Directory
#######################################

PROJECT_DIR="$( dirname "${CURRENT_DIR}" )"
readonly PROJECT_DIR
export PROJECT_DIR

#######################################
# Docker Directory
#######################################

readonly DOCKER_DIR="${PROJECT_DIR}/docker"
export DOCKER_DIR

#######################################
# Template Directory
#######################################

readonly TEMPLATE_DIR="${PROJECT_DIR}/sonarscanner-templates"
export TEMPLATE_DIR
