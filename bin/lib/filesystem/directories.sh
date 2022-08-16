# shellcheck shell=bash
#
# Localhost SonarQube internal filesystem directories functions.

#######################################
# Check if the directory exists.
#
# Arguments:
#   Directory
#
# Returns:
#   0 if the directory exists.
#   1 if the directory does not exists.
#######################################
function filesystem::does_directory_exists() {
  [ -d "${1}" ] && return 0 || return 1
}
