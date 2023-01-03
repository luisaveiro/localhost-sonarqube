# shellcheck shell=bash
#
# Localhost SonarQube start command.

#######################################
# Alias command for up command.
#######################################
function command::start() {
  command::up "$@"
}

#######################################
# Display helpful information for
# the start command.
#
# Globals:
#   APP_COMMAND
#
# Outputs:
#   Writes helpful information to
#   stdout.
#######################################
function explain::start() {
  explain::display_description \
    "Start is an alias command for $(ansi --bold --white "up")."

  explain::display_usage "start"

  explain::display_helpful_tips

  explain::display_more_information \
    "$(ansi --bold --white "${APP_COMMAND} help up")"
}
