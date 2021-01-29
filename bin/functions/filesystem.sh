# shellcheck shell=bash
#
# Internal file system functions used by the sonarqube commands.

#######################################
# Check if file is exists.
#
# Arguments:
#   File
#
# Returns:
#   0 if file exists.
#   1 if file does not exsits.
#######################################
function file_exists() {
  [ -f "${1}" ] && return 0 || return 1
}
