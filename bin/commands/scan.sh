# shellcheck shell=bash
#
# SonarQube scan shell command

#######################################
# Scan project source code with SonarScanner.
#
# Arguments:
#   --properties_file
#   --docker_network
#   --docker_image
#
# Returns:
#   1 if properties file is missing in directory.
#######################################
function command::scan() {
  local properties_file docker_network docker_image

  while [ $# -gt 0 ]; do
    if [[ $1 == *"--"* ]]; then
      local argument="${1/--/}"

      IFS='=' read -ra parameter <<< "${argument}"

      declare "${parameter[0]}"="${parameter[1]}"
    fi

    shift
  done

  if ! file_exists "$(pwd)/${properties_file}"; then
    warning "Add $(ansi --bold --white "${properties_file}") before running SonarScanner."
    info "Use the following commands: $(ansi --bold --white sonarqube publish) or $(ansi --bold --white sonarqube publish "<template>")."

    exit 1
  fi

  docker::run \
    --network="${docker_network}" \
    --image="${docker_image}" \
    --volume="$(pwd)" \
    --workdir="/user/src"
}
