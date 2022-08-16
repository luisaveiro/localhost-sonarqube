# shellcheck shell=bash
#
# Localhost SonarQube stop command.

#######################################
# Alias command for down command.
#######################################
function command::stop() {
  command::down "$@"
}
