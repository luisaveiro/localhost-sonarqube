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
#   1 if properties file is missing in directory or SonarQube is not running.
#######################################
function command::scan() {
  local arguments_list=("properties_file" "docker_network" "docker_image")
  local properties_file docker_network docker_image workdir="/user/src"

  while [ $# -gt 0 ]; do
    if [[ $1 == *"--"* && $1 == *"="* ]]; then
      local argument="${1/--/}"

      IFS='=' read -ra parameter <<< "${argument}"

      if [[ "${arguments_list[*]}" =~ ${parameter[0]} ]]; then
        declare "${parameter[0]}"="${parameter[1]}"
      fi
    fi

    shift
  done

  if ! file_exists "$(pwd)/${properties_file}"; then
    warning "Add $(ansi --bold --white "${properties_file}")" \
      "before running SonarScanner."

    output "Use the following commands:" \
      "$(ansi --bold --white sonarqube publish) or " \
      "$(ansi --bold --white sonarqube publish "<template>")."

    exit 1
  fi

  if ! docker::is_container_running sonarqube; then
    warning "SonarQube is not running!"

    output "SonarScanner requires SonarQube to process the analysis report." \
      "Use the following command: $(ansi --bold --white sonarqube up)."

    exit 1
  fi

  docker::run \
    --name="sonarscanner" \
    --network="${docker_network}" \
    --image="${docker_image}" \
    --volume="$(pwd):${workdir}" \
    --volume="sonarscanner_cache:/opt/sonar-scanner/.sonar/cache" \
    --workdir="${workdir}"
}
