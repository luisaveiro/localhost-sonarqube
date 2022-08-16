# shellcheck shell=bash
#
# Localhost SonarQube internal explain helper functions.

#######################################
# Display helpful information for
# the list command.
#
# Globals:
#   APP_COMMAND
#   GIT_REPOSITORY
#
# Outputs:
#   Writes helpful information to
#   stdout.
#######################################
function explain::command_list() {
  local helpful_tips=(
    "List available SonarScanner properties files under sonarscanner-templates:"
    "${APP_COMMAND} list"
  )

  explain::display_description "List available SonarScanner properties files."

  explain::display_usage "list"

  explain::display_helpful_tips "${helpful_tips[@]}"

  explain::display_more_information "${GIT_REPOSITORY}#list-command"
}
