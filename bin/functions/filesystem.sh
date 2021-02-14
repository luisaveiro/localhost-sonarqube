# shellcheck shell=bash
#
# Internal file system functions used by the sonarqube commands.

#######################################
# Check if directory exists.
#
# Arguments:
#   Directory
#
# Returns:
#   0 if directory exists.
#   1 if directory does not exists.
#######################################
function directory_exists() {
  [ -d "${1}" ] && return 0 || return 1
}

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
