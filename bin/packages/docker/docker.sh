# shellcheck shell=bash
#
# Docker package.

#######################################
# Check if a Docker container is running.
#
# Arguments:
#   Docker container ID or name
#
# Returns:
#   0 if Docker container is running.
#   1 if Docker container is not running.
#######################################
function docker::is_container_running() {
  [ "$(docker ps -q -f name="${1}")" ] && return 0 || return 1
}

#######################################
# Check if docker is running on machine.
#
# Returns:
#   0 if Docker is running.
#   1 if Docker is not running.
#######################################
function docker::is_docker_running() {
  if ! docker info > /dev/null 2>&1; then
    return 1
  fi

  return 0
}

#######################################
# Run a command in a new Docker container.
#
# Arguments:
#   --volume
#   --image
#   --workdir
#   --network
#   command
#######################################
function docker::run() {
  local arguments_list=("volume" "image" "workdir" "network")
  local volumes=() image workdir network command

  command=$*

  while [ $# -gt 0 ]; do
    if [[ $1 == *"--"* && $1 == *"="* ]]; then
      local arguments="${1/--/}"

      IFS='=' read -ra parameter <<< "${arguments}"

      if [[ "${arguments_list[*]}" =~ ${parameter[0]} ]]; then
        command="${command/--${arguments}/}"

        if [[ $1 == *"--volume="* ]]; then
          if [ "${parameter[1]}" != "" ]; then
            volumes+=("--volume" "${parameter[1]}")
          fi
        else
          declare "${parameter[0]}"="${parameter[1]}"
        fi
      fi
    fi

    shift
  done

  IFS=' ' read -ra command <<< "${command}"

  docker run \
    --interactive \
    --tty \
    --rm \
    --network="$network" \
    "${volumes[@]}" \
    --workdir "${workdir}" \
    "${image}" \
    "${command[@]}"
}
