# shellcheck shell=bash
#
# Localhost SonarQube about command.

#######################################
# Display the Localhost SonarQube about
# information.
#
# Globals:
#   APP_NAME
#   GIT_REPOSITORY
#   PROJECT_DIR
#
# Outputs:
#   Writes about information to stdout.
#######################################
function command::about() {
  local latest_tag
  local timestamp

  latest_tag="$(git::latest_tag --dir="${PROJECT_DIR}")"
  timestamp="$(git::tag_timestamp --dir="${PROJECT_DIR}" --tag="${latest_tag}")"

  console::output \
    "$(ansi --bold --white "${APP_NAME}") - ${latest_tag} - ${timestamp}"

  console::output --margin-bottom "Path: $(ansi --italic "${PROJECT_DIR}")"

  console::output "See ${GIT_REPOSITORY} for more information."
}

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
function explain::about() {
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
