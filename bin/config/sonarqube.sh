# shellcheck shell=bash
#
# Define Localhost SonarQube global SonarQube constants.

#######################################
# SonarQube Dashboard Port
#######################################

SONARQUBE_PORT="$(dotenv::get SONARQUBE_PORT --default=9000)"
readonly SONARQUBE_PORT

#######################################
# SonarQube Dashboard URL
#######################################

readonly SONARQUBE_DASHBOARD_URL="http://localhost:${SONARQUBE_PORT}"
export SONARQUBE_DASHBOARD_URL
