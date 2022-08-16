# shellcheck shell=bash
#
# Localhost SonarQube internal explain helper functions.

#######################################
# Display helpful information for
# the docs command.
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
function explain::command_docs() {
  local helpful_tips=(
    "To open the docs URL in your default browser:"
    "${APP_COMMAND} docs"

    "To open the wiki URL in your default browser use the \"--wiki\" option:"
    "${APP_COMMAND} docs --wiki"

    "The wiki command is an alias for the docs command with the --wiki option:"
    "${APP_COMMAND} wiki"
  )

  local options=(
    "--wiki" "Open ${APP_ANME} GitHub wiki in the browser."
  )

  explain::display_description \
    "Open ${APP_NAME} documentation in your default browser."

  explain::display_usage "docs [options]"

  explain::display_options "${options[@]}"

  explain::display_helpful_tips "${helpful_tips[@]}"

  explain::display_more_information "${GIT_REPOSITORY}#docs-command"
}
