# shellcheck shell=bash
#
# Localhost SonarQube internal explain helper functions.

#######################################
# Display helpful information for
# the analyse command.
#
# Globals:
#   APP_COMMAND
#
# Outputs:
#   Writes helpful information to
#   stdout.
#######################################
function explain::command_analyse() {
  explain::display_description \
    "analyse is an alias command for $(ansi --bold --white "scan")."

  explain::display_usage "analyse"

  explain::display_helpful_tips

  explain::display_more_information \
    "$(ansi --bold --white "${APP_COMMAND} help scan")"
}
