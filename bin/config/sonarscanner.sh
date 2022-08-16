# shellcheck shell=bash
#
# Define Localhost SonarQube global SonarScanner constants.

#######################################
# SonarScanner Docker Image
#######################################

readonly SONARSCANNER_DOCKER_IMAGE="sonarsource/sonar-scanner-cli:latest"
export SONARSCANNER_DOCKER_IMAGE

#######################################
# SonarScanner Docker Network
#######################################

readonly SONARSCANNER_DOCKER_NETWORK="sonarqube-network"
export SONARSCANNER_DOCKER_NETWORK

#######################################
# SonarScanner Configuration File
#######################################

readonly SONARSCANNER_PROPERTIES_FILE="sonar-project.properties"
export SONARSCANNER_PROPERTIES_FILE
