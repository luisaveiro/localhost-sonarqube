# shellcheck shell=bash
#
# Localhost SonarQube internal explain helper functions.

#######################################
# Display helpful information for
# the self-update command.
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
function explain::command_self_update() {
  local helpful_tips=(
    "Update ${APP_NAME}, SonarQube & SonarScanner to the latest version:"
    "${APP_COMMAND} self-update"
  )

  explain::display_description \
    "Update ${APP_NAME} to the latest version."

  explain::display_usage "self-update"

  explain::display_helpful_tips "${helpful_tips[@]}"

  explain::display_more_information "${GIT_REPOSITORY}#self-update-command"
}
