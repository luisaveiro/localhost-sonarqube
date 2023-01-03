# shellcheck shell=bash
#
# Localhost SonarQube stop command.

#######################################
# Alias command for down command.
#######################################
function command::stop() {
  command::down "$@"
}

#######################################
# Display helpful information for
# the stop command.
#
# Globals:
#   APP_COMMAND
#
# Outputs:
#   Writes helpful information to
#   stdout.
#######################################
function explain::stop() {
  explain::display_description \
    "Stop is an alias command for $(ansi --bold --white "down")."

  explain::display_usage "stop"

  explain::display_helpful_tips

  explain::display_more_information \
    "$(ansi --bold --white "${APP_COMMAND} help down")"
}
