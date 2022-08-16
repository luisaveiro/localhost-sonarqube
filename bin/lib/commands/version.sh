# shellcheck shell=bash
#
# Localhost SonarQube version command.

#######################################
# Display the Localhost SonarQube
# version.
#
# Globals:
#   PROJECT_DIR
#
# Outputs:
#   Writes current version to stdout.
#######################################
function command::version() {
  console::output "$(git::active_branch --dir="${PROJECT_DIR}")"
}
