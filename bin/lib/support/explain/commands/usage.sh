# shellcheck shell=bash
#
# Localhost SonarQube internal explain helper functions.

#######################################
# Display helpful information for
# the usage command.
#
# Globals:
#   APP_COMMAND
#   GIT_REPOSITORY
#
# Outputs:
#   Writes helpful information to
#   stdout.
#######################################
function explain::command_usage() {
  local helpful_tips=(
    "The usage command lists all commands:"
    "${APP_COMMAND} usage"

    "Alternatively, you can use sonarqube without providing commands:"
    "${APP_COMMAND}"
  )

  explain::display_description \
    "Display a list of all available commands."
  explain::display_usage "usage"
  explain::display_helpful_tips "${helpful_tips[@]}"
  explain::display_more_information "${GIT_REPOSITORY}#usage-command"
}
