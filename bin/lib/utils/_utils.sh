# shellcheck shell=bash
#
# Load Localhost SonarQube utilities.

#######################################
# Define Utilities
#######################################

readonly UTILITIES=(
  "browser"
  "docker"
  "docker_compose"
  "git"
  "os"
)

#######################################
# Load Utilities
#######################################

for UTILITY in "${UTILITIES[@]}"; do
  # shellcheck source=/dev/null
  source "${LIB_DIR}/utils/${UTILITY}.sh"
done
