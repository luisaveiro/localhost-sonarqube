# shellcheck shell=bash
#
# Localhost SonarQube scan command.

#######################################
# Scan a project source code with
# SonarScanner.
#
# Globals:
#   APP_COMMAND
#   SONARSCANNER_DOCKER_IMAGE
#   SONARSCANNER_DOCKER_NETWORK
#   SONARSCANNER_PROPERTIES_FILE
#
# Outputs:
#   Writes error messages to stdout.
#
# Returns:
#   1 if properties file is missing
#     in directory or SonarQube is
#     not running.
#######################################
function command::scan() {
  local timestamp
  local workdir="/user/src"

  timestamp=$(date +%s)

  if ! filesystem::does_file_exists "$(pwd)/${SONARSCANNER_PROPERTIES_FILE}";
  then
    console::warning --margin-bottom \
      "$(ansi --bold --white "${SONARSCANNER_PROPERTIES_FILE}") does not exist."

    console::output \
      "Please add $(ansi --bold --white "${SONARSCANNER_PROPERTIES_FILE}")" \
      "before scanning your project with SonarScanner. Use the following" \
      "commands: $(ansi --bold --white "${APP_COMMAND} publish")."

      exit 1
  fi

  if ! sonarqube::is_running; then
    console::error --margin-bottom "SonarQube is not running!"

    console::output \
      "SonarScanner requires SonarQube to process the analysis report." \
      "Use the following command: $(ansi --bold --white "${APP_COMMAND} up")."

    exit 1
  fi

  docker::run \
    --name="sonarscanner_${timestamp}" \
    --network="${SONARSCANNER_DOCKER_NETWORK}" \
    --image="${SONARSCANNER_DOCKER_IMAGE}" \
    --volume="$(pwd):${workdir}" \
    --volume="sonarscanner_cache:/opt/sonar-scanner/.sonar/cache" \
    --workdir="${workdir}"
}
