# shellcheck shell=bash
#
# SonarQube scan shell command

#######################################
# Scan project source code with SonarScanner.
#
# Globals:
#   PROPERTIES_FILE
#   SONARSCANNER_DOCKER_IMAGE
#   SONARSCANNER_DOCKER_NETWORK
#
# Returns:
#   1 if properties file is missing in directory.
#######################################
function command::scan() {
  if ! file_exists "$(pwd)/${PROPERTIES_FILE}"; then
    warning "Add $(ansi --bold --white "${PROPERTIES_FILE}") before running SonarScanner."
    info "Use the following commands: $(ansi --bold --white sonarqube publish) or $(ansi --bold --white sonarqube publish "<template>")."

    exit 1
  fi

  docker::run \
    --network="${SONARSCANNER_DOCKER_NETWORK}" \
    --image="${SONARSCANNER_DOCKER_IMAGE}" \
    --volume="$(pwd)" \
    --workdir="/user/src"
}
