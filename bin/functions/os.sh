# shellcheck shell=bash
#
# Internal os functions used by the sonarqube commands.

#######################################
# Check if operating system is either macOS, Linux, and Windows.
#
# Returns:
#   1 if OS is not supported.
#######################################
function is_operating_system_supported() {
  local unameout machine

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
    error "Unsupported OS [$(ansi --bold --white "${unameout}")]." \
      "Docker supports macOS, Linux, and Windows (WSL2)."

    exit 1
  fi
}
