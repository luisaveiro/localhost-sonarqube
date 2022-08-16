# shellcheck shell=bash
#
# Localhost SonarQube wiki command.

#######################################
# Alias command for docs command.
#######################################
function command::wiki() {
  command::docs "--wiki"
}
