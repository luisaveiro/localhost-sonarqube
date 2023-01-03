# shellcheck shell=bash
#
# Localhost SonarQube support command.

#######################################
# Alias command for fund command.
#######################################
function command::support() {
  command::fund "$@"
}

#######################################
# Display helpful information for
# the support command.
#
# Globals:
#   APP_COMMAND
#
# Outputs:
#   Writes helpful information to
#   stdout.
#######################################
function explain::support() {
  explain::display_description \
    "Support is an alias command for $(ansi --bold --white "fund")."

  explain::display_usage "support"

  explain::display_helpful_tips

  explain::display_more_information \
    "$(ansi --bold --white "${APP_COMMAND} help fund")"
}
