# shellcheck shell=bash
#
# Localhost SonarQube internal explain helper functions.

#######################################
# Display helpful information for
# the wiki command.
#
# Globals:
#   APP_COMMAND
#
# Outputs:
#   Writes helpful information to
#   stdout.
#######################################
function explain::command_wiki() {
  explain::display_description \
    "Wiki is an alias command for $(ansi --bold --white "docs --wiki")."

  explain::display_usage "wiki"

  explain::display_helpful_tips

  explain::display_more_information \
    "$(ansi --bold --white "${APP_COMMAND} help docs")"
}
