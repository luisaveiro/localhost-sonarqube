# shellcheck shell=bash
#
# Localhost SonarQube analyse command.

#######################################
# Alias command for the scan command.
#######################################
function command::analyse() {
  command::scan "$@"
}

#######################################
# Display the helpful information for
# the analyse command.
#
# Globals:
#   APP_COMMAND
#
# Outputs:
#   Writes messages to stdout.
#######################################
function explain::analyse() {
  explain::display_description \
    "analyse is an alias command for $(ansi --bold --white "scan")."

  explain::display_usage "analyse"

  explain::display_helpful_tips

  explain::display_more_information \
    "$(ansi --bold --white "${APP_COMMAND} help scan")"
}
