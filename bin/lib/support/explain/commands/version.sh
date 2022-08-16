# shellcheck shell=bash
#
# Localhost SonarQube internal explain helper functions.

#######################################
# Display helpful information for
# the version command.
#
# Globals:
#   APP_COMMAND
#   APP_NAME
#   GIT_REPOSITORY
#
# Outputs:
#   Writes helpful information to
#   stdout.
#######################################
function explain::command_version() {
  local helpful_tips=(
    "The version command displays the Git checked out tag or branch:"
    "${APP_COMMAND} version"
  )

  explain::display_description \
    "Display ${APP_NAME} installed version."
  explain::display_usage "version"
  explain::display_helpful_tips "${helpful_tips[@]}"
  explain::display_more_information "${GIT_REPOSITORY}#version-command"
}
