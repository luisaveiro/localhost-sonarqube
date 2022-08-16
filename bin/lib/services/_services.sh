# shellcheck shell=bash
#
# Load Localhost SonarQube services dependencies.

#######################################
# Define Services Dependencies
#######################################

readonly SERVICE_DEPENDENCIES=(
  "sonarqube"
  "sonarscanner"
)

#######################################
# Load Services Dependencies
#######################################

for SERVICE in "${SERVICE_DEPENDENCIES[@]}"; do
  # shellcheck source=/dev/null
  source "${LIB_DIR}/services/${SERVICE}.sh"
done
