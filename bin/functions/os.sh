# shellcheck shell=bash
#
# Internal os functions used by the sonarqube commands.

#######################################
# Check if operating system is either macOS, Linux, and Windows.
#
# Globals:
#   WHITE
#   NC
#
# Outputs:
#   Writes message to stdout.
#
# Returns:
#   1 if OS is not supported.
#######################################
function is_operating_system_supported() {
  local unameout
  local machine

  unameout="$(uname -s)"

  case $unameout in
    Linux*)
      machine=Linux;;
    Darwin*)
      machine=mac;;
    *)
      machine="UNKNOWN";;
  esac

  if [ $machine == "UNKNOWN" ]; then
    output "${WHITE}Unsupported OS [${unameout}]. Docker supports macOS, Linux, and Windows (WSL2).${NC}"

    exit 1
  fi
}
