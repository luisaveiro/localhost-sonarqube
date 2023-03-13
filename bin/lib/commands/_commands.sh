# shellcheck shell=bash
#
# Load Localhost SonarQube commands.

#######################################
# Define Commands
#######################################

readonly COMMANDS=(
  "about"
  "analyse"
  "config"
  "dashboard"
  "docs"
  "down"
  "fund"
  "help"
  "list"
  "port"
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
# Load Commands
#######################################

for COMMAND in "${COMMANDS[@]}"; do
  # shellcheck source=/dev/null
  source "${LIB_DIR}/commands/${COMMAND}.sh"
done
