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
#   Writes messages to stdout.
#
# Returns:
#   1 if properties file is missing
#   in directory or SonarQube is
#   not running.
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
      "command: $(ansi --bold --white "${APP_COMMAND} publish")."

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

#######################################
# Display the helpful information for
# the scan command.
#
# Globals:
#   APP_COMMAND
#   GIT_REPOSITORY
#
# Outputs:
#   Writes messages to stdout.
#######################################
function explain::scan() {
  local helpful_tips=(
    "To scan your project source code, run scan in your project root directory:"
    "${APP_COMMAND} scan"
  )

  explain::display_description "Scan project source code with SonarScanner."

  explain::display_usage "scan"

  explain::display_helpful_tips "${helpful_tips[@]}"

  explain::display_more_information "${GIT_REPOSITORY}#scan-command"
}
