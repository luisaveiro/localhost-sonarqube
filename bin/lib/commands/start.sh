# shellcheck shell=bash
#
# Localhost SonarQube start command.

#######################################
# Alias command for up command.
#######################################
function command::start() {
  command::up "$@"
}
