# shellcheck shell=bash
#
# Localhost SonarQube dependencies manager.

#######################################
# Define Third-Party Packages
#######################################

readonly PACKAGES=(
  "bashdrop/ansi/ansi.sh"
)

#######################################
# Load Third-Party Packages
#######################################

for PACKAGE in "${PACKAGES[@]}"; do
  # shellcheck source=/dev/null
  source "${BIN_DIR}/packages/${PACKAGE}"
done

#######################################
# Define Dependencies Directory
#######################################

readonly LIB_DIR="${BIN_DIR}/lib"

#######################################
# Define Dependencies
#######################################

readonly DEPENDENCIES=(
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
