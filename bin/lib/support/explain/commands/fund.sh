# shellcheck shell=bash
#
# Localhost SonarQube internal explain helper functions.

#######################################
# Display helpful information for
# the fund command.
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
function explain::command_fund() {
  local helpful_tips=(
    "Discover how to help fund the maintenance ${APP_NAME}:"
    "${APP_COMMAND} fund"

    "Alternatively, you can use the support command:"
    "${APP_COMMAND} support"
  )

  explain::display_description \
    "Display ${APP_NAME} funding information."

  explain::display_usage "fund"

  explain::display_helpful_tips "${helpful_tips[@]}"

  explain::display_more_information "${GIT_REPOSITORY}#fund-command"
}
