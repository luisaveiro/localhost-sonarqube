# shellcheck shell=bash
#
# Docker compose package.

#######################################
# Execute a command with Docker compose.
#
# Arguments:
#   --file
#   --project_name
#   command
#######################################
function docker_compose::command() {
  local arguments_list=("file" "project_name")
  local file project_name command

  command=$*

  while [ $# -gt 0 ]; do
    if [[ $1 == *"--"* && $1 == *"="* ]]; then
      local argument="${1/--/}"

      IFS='=' read -ra parameter <<< "${argument}"

      if [[ "${arguments_list[*]}" =~ ${parameter[0]} ]]; then
        command="${command/--${argument}/}"
        declare "${parameter[0]}"="${parameter[1]}"
      fi
    fi

    shift
  done

  IFS=' ' read -ra command <<< "${command}"

  docker-compose \
    --file "${file}" \
    --project-name "${project_name}" \
    "${command[@]}"
}
