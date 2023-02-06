# shellcheck shell=bash
#
# Localhost SonarQube internal Docker functions.

#######################################
# Get the mounted volume for the Docker
# container.
#
# Arguments:
#   Docker container ID or name
#
# Outputs:
#   Writes Docker mounted volume to
#   stdout.
#######################################
function docker::container_mounted_volume() {
  local containerID
  local regex

  regex="{{ range .Mounts }}{{ if eq .Type \"bind\" }}"
  regex+="{{ .Source }}{{ end }}{{ end }}"

  containerID="$( docker ps -q -f name="${1}" )"

  console::output "$( docker inspect -f "${regex}" "${containerID}" )"
}

#######################################
# Check if a Docker container is
# running.
#
# Arguments:
#   Docker container ID or name
#
# Returns:
#   0 if the container is running.
#   1 if the container is not running.
#######################################
function docker::is_container_running() {
  [ "$(docker ps -q -f name="${1}")" ] && return 0 || return 1
}

#######################################
# Check if the Docker service is
# running on the machine.
#
# Returns:
#   0 if Docker is running.
#   1 if Docker is not running.
#######################################
function docker::is_docker_running() {
  docker info > /dev/null 2>&1 && return 0 || return 1
}

#######################################
# Update a Docker image.
#
# Arguments:
#   image
#######################################
function docker::pull() {
  _="$(docker pull --quiet "${1}")"
}

#######################################
# Start a Docker container.
#
# Arguments:
#   --image
#   --name
#   --network
#   --volume
#   --workdir
#   command
#
# Outputs:
#   Writes Docker Compose messaging to
#   stdout.
#######################################
function docker::run() {
  local arguments_list=("image" "name" "network" "volume" "workdir")
  local docker_command
  local image
  local name
  local network
  local volumes=()
  local workdir

  docker_command="${*}"

  while [ $# -gt 0 ]; do
    if [[ "${1}" == *"--"* && "${1}" == *"="* ]]; then
      local arguments="${1/--/}"

      IFS='=' read -ra parameter <<< "${arguments}"

      if [[ "${arguments_list[*]}" =~ ${parameter[0]} ]]; then
        docker_command="${docker_command/--${arguments}/}"

        if [[ $1 == *"--volume="* ]]; then
          if [ -n "${parameter[1]}" ]; then
            volumes+=("--volume" "${parameter[1]}")
          fi
        else
          declare "${parameter[0]}"="${parameter[1]}"
        fi
      fi
    fi

    shift
  done

  IFS=' ' read -ra docker_command <<< "${docker_command}"

  docker run \
    --interactive \
    --tty \
    --rm \
    --name="${name}" \
    --network="${network}" \
    "${volumes[@]}" \
    --workdir "${workdir}" \
    "${image}" \
    "${docker_command[@]}"
}
