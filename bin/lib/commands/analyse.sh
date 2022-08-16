# shellcheck shell=bash
#
# Localhost SonarQube analyse command.

#######################################
# Alias command for the scan command.
#######################################
function command::analyse() {
  command::scan "$@"
}
