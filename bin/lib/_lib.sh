# shellcheck shell=bash
#
# Localhost SonarQube dependencies manager.

#######################################
# Define Third-Party Packages
#######################################

PACKAGES=(
  "blacksmith-engineers/ansi/ansi.sh"
)

#######################################
# Load Third-Party Packages
#######################################

for PACKAGE in "${PACKAGES[@]}"; do
  # shellcheck source=/dev/null
  source "${CURRENT_DIR}/packages/${PACKAGE}"
done

#######################################
# Define Dependencies Directory
#######################################

readonly LIB_DIR="${CURRENT_DIR}/lib"

#######################################
# Define Dependencies
#######################################

DEPENDENCIES=(
  "commands"
  "console"
  "core"
  "filesystem"
  "services"
  "support"
  "utils"
)

#######################################
# Load Dependencies
#######################################

for DEPENDENCY in "${DEPENDENCIES[@]}"; do
  # shellcheck source=/dev/null
  source "${LIB_DIR}/${DEPENDENCY}/_${DEPENDENCY}.sh"
done
