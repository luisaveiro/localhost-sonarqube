# shellcheck shell=bash
#
# Docker compose package.

#######################################
# Execute a command with Docker compose.
#
# Arguments:
#   --file
#   command
#######################################
function docker_compose::command() {
  local file command

  command=$*

  while [ $# -gt 0 ]; do
    if [[ $1 == *"--file="* ]]; then
      local argument="${1/--/}"
      command="${command/--${argument}/}"

      IFS='=' read -ra parameter <<< "${argument}"

      declare "${parameter[0]}"="${parameter[1]}"
    fi

    shift
  done

  IFS=' ' read -ra command <<< "${command}"

  docker-compose --file "${file}" "${command[@]}"
}
