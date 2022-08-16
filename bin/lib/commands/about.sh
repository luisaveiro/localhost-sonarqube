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
