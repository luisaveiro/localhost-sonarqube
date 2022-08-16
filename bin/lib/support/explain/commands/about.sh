# shellcheck shell=bash
#
# Localhost SonarQube internal explain helper functions.

#######################################
# Display helpful information for
# the about command.
#
# Globals:
#   APP_COMMAND
#   GIT_REPOSITORY
#
# Outputs:
#   Writes helpful information to
#   stdout.
#######################################
function explain::command_about() {
  local helpful_tips=(
    "The about command displays information including the version & path:"
    "${APP_COMMAND} about"
  )

  explain::display_description \
    "Shows a short information about Localhost SonarQube."

  explain::display_usage "about"

  explain::display_helpful_tips "${helpful_tips[@]}"

  explain::display_more_information "${GIT_REPOSITORY}#about-command"
}
