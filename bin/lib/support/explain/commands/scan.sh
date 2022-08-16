# shellcheck shell=bash
#
# Localhost SonarQube internal explain helper functions.

#######################################
# Display helpful information for
# the scan command.
#
# Globals:
#   APP_COMMAND
#   GIT_REPOSITORY
#
# Outputs:
#   Writes helpful information to
#   stdout.
#######################################
function explain::command_scan() {
  local helpful_tips=(
    "To scan your project source code, run scan in your project root directory:"
    "${APP_COMMAND} scan"
  )

  explain::display_description "Scan project source code with SonarScanner."

  explain::display_usage "scan"

  explain::display_helpful_tips "${helpful_tips[@]}"

  explain::display_more_information "${GIT_REPOSITORY}#scan-command"
}
