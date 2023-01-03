# shellcheck shell=bash
#
# Load Localhost SonarQube support helpers.

#######################################
# Define Support Helpers
#######################################

readonly SUPPORT_HELPERS=(
  "explain"
  "help"
)

#######################################
# Load Support Helpers
#######################################

for SUPPORT_HELPER in "${SUPPORT_HELPERS[@]}"; do
  # shellcheck source=/dev/null
  source "${LIB_DIR}/support/${SUPPORT_HELPER}.sh"
done
