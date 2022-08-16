# shellcheck shell=bash
#
# Load Localhost SonarQube filesystem dependencies.

#######################################
# Define Filesystem Dependencies
#######################################

readonly FILESYSTEM_DEPENDENCIES=(
  "directories"
  "files"
)

#######################################
# Load Filesystem Dependencies
#######################################

for FILESYSTEM in "${FILESYSTEM_DEPENDENCIES[@]}"; do
  # shellcheck source=/dev/null
  source "${LIB_DIR}/filesystem/${FILESYSTEM}.sh"
done
