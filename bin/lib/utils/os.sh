# shellcheck shell=bash
#
# Localhost SonarQube internal OS detection functions.

#######################################
# Check if user's operating system has
# packaged installed.
#
# Arguments:
#   Package name
#
# Returns:
#   0 if OS package is installed.
#   1 if OS package is not installed.
#######################################
function os::has_installed() {
  [[ -z $( type -t "${1}" ) ]] && return 1 || return 0
}

#######################################
# Check if user's operating system is
# supported.
#
# Returns:
#   0 if OS is supported.
#   1 if OS is not supported.
#######################################
function os::is_supported() {
  local machine
  local unameout

  unameout="$( uname -s )"

  case $unameout in
    Linux*)
      machine=Linux;;
    Darwin*)
      machine=mac;;
    *)
      machine="UNKNOWN";;
  esac

  [ $machine == "UNKNOWN" ] && return 1 || return 0
}
