# shellcheck shell=bash
#
# Localhost SonarQube support command.

#######################################
# Alias command for fund command.
#######################################
function command::support() {
  command::fund "$@"
}
