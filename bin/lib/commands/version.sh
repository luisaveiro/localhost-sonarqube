# shellcheck shell=bash
#
# Localhost SonarQube version command.

#######################################
# Display the Localhost SonarQube
# version.
#
# Globals:
#   PROJECT_DIR
#
# Outputs:
#   Writes current version to stdout.
#######################################
function command::version() {
  console::output "$(git::active_branch --dir="${PROJECT_DIR}")"
}

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
function explain::version() {
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
