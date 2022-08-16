# shellcheck shell=bash
#
# Load Localhost SonarQube console.

#######################################
# Define Console Dependencies
#######################################

readonly CONSOLE_DEPENDENCIES=(
  "message"
  "output"
  "progressbar"
)

#######################################
# Load Console Dependencies
#######################################

for CONSOLE in "${CONSOLE_DEPENDENCIES[@]}"; do
  # shellcheck source=/dev/null
  source "${LIB_DIR}/console/${CONSOLE}.sh"
done
