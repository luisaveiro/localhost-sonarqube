# shellcheck shell=bash
#
# Localhost SonarQube internal Docker Compose functions.

#######################################
# Execute a Docker Compose command.
#
# Arguments:
#   --file
#   --project_name
#   command
#
# Outputs:
#   Writes Docker Compose messaging to
#   stdout.
#######################################
function docker_compose::command() {
  local arguments_list=("file" "project_name")
  local docker_command="${*}"
  local file
  local project_name

  while [ $# -gt 0 ]; do
    if [[ $1 == *"--"* && $1 == *"="* ]]; then
      local argument="${1/--/}"

      IFS='=' read -ra parameter <<< "${argument}"

      if [[ "${arguments_list[*]}" =~ ${parameter[0]} ]]; then
        docker_command="${docker_command/--${argument}/}"
        declare "${parameter[0]}"="${parameter[1]}"
      fi
    fi

    shift
  done

  IFS=' ' read -ra docker_command <<< "${docker_command}"

  docker-compose \
    --file "${file}" \
    --project-name "${project_name}" \
    "${docker_command[@]}"
}
