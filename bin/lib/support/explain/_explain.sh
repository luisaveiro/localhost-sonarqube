# shellcheck shell=bash
#
# Load Localhost SonarQube explain helpers.

#######################################
# Define Dependencies Directory
#######################################

readonly EXPLAIN_DIR="${LIB_DIR}/support/explain"

#######################################
# Define Explain Commands
#######################################

readonly EXPLAIN_COMMANDS=(
  "about"
  "analyse"
  "config"
  "dashboard"
  "docs"
  "down"
  "fund"
  "help"
  "list"
  "publish"
  "restart"
  "scan"
  "self_update"
  "start"
  "status"
  "stop"
  "support"
  "up"
  "usage"
  "version"
  "wiki"
)

#######################################
# Load Explain Commands
#######################################

for EXPLAIN_COMMAND in "${EXPLAIN_COMMANDS[@]}"; do
  # shellcheck source=/dev/null
  source "${EXPLAIN_DIR}/commands/${EXPLAIN_COMMAND}.sh"
done

#######################################
# Define Explain Helpers
#######################################

readonly EXPLAIN_HELPERS=(
  "display_sections"
)

#######################################
# Load Explain Helpers
#######################################

for EXPLAIN_HELPER in "${EXPLAIN_HELPERS[@]}"; do
  # shellcheck source=/dev/null
  source "${EXPLAIN_DIR}/${EXPLAIN_HELPER}.sh"
done
