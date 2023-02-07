# shellcheck shell=bash
#
# Localhost SonarQube internal filesystem files functions.

#######################################
# Check if the file exists.
#
# Arguments:
#   File
#
# Returns:
#   0 if the file exists.
#   1 if the file does not exsits.
#######################################
function filesystem::does_file_exists() {
  [ -f "${1}" ] && return 0 || return 1
}

#######################################
# Get the file name from the path.
#
# Arguments:
#   Path
#
# Outputs:
#   The file name.
#######################################
function filesystem::file_name() {
  basename -- "${1}"
}
