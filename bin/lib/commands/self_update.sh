# shellcheck shell=bash
#
# Localhost SonarQube self update command.

#######################################
# Update Localhost Sonarqube to the
# latest version.
#
# Globals:
#   APP_COMMAND
#   APP_NAME
#   DOCKER_COMPOSE_FILE
#   DOCKER_PROJECT_NAME
#   PROJECT_DIR
#   SONARSCANNER_DOCKER_IMAGE
#
# Outputs:
#   Writes messages to stdout.
#######################################
function command::self_update() {
  local latest_tag

  if ! os::has_installed git; then
    console::error --margin-top --margin-bottom "Git is not installed!"

    # Git download URL.
    local url="https://git-scm.com"
    readonly url

    console::output \
      "$(ansi --bold --white "${APP_NAME}") requires Git to update to the" \
      "latest version. Please installed Git via" \
      "$(ansi --bold --white --underline "${url}")."

    exit 1
  fi

  console::info \
    "[1/3] Updating $(ansi --bold --white SonarQube) Docker image ..."

  progressbar::start
  progressbar::half

  docker_compose::command \
    --project_name="${DOCKER_PROJECT_NAME}" \
    --file="${DOCKER_COMPOSE_FILE}" \
    pull --quiet

  progressbar::finish --clear

  console::info --overwrite \
    "[1/3] Updating $(ansi --bold --white SonarQube) Docker image" \
    "$(ansi --bold --white "[OK]")"

  if sonarqube::is_running; then
    console::notice --margin-top --margin-bottom \
      "SonarQube is currently running!"

    console::output --margin-bottom \
      "Please restart SonarQube to use the new version. Use the following" \
      "command: $(ansi --bold --white "${APP_COMMAND} restart")."
  fi

  console::info \
    "[2/3] Updating $(ansi --bold --white SonarScanner) Docker image ..."

  progressbar::start
  progressbar::half

  docker::pull "${SONARSCANNER_DOCKER_IMAGE}"

  progressbar::finish --clear

  console::info --overwrite \
    "[2/3] Updating $(ansi --bold --white SonarScanner) Docker image ..." \
    "$(ansi --bold --white "[OK]")"

  if sonarscanner::is_running; then
    console::notice --margin-top --margin-bottom \
      "SonnarScanner is scanning a project!"

    console::output --margin-bottom \
      "The current scan will use the previous version of SonnarScanner."
  fi

  git::fetch --dir="${PROJECT_DIR}"

  latest_tag="$(git::latest_tag --dir="${PROJECT_DIR}")"

  console::info \
    "[3/3] Updating $(ansi --bold --white "${APP_NAME}")" \
    "to $(ansi --bold --white "${latest_tag}") ..."

  progressbar::start
  progressbar::half
  progressbar::finish --clear

  console::info --overwrite \
    "[3/3] Updating $(ansi --bold --white "${APP_NAME}")" \
    "to $(ansi --bold --white "${latest_tag}") $(ansi --bold --white "[OK]")"

  git::checkout --dir="${PROJECT_DIR}" --branch="${latest_tag}"
}

#######################################
# Display the helpful information for
# the self-update command.
#
# Globals:
#   APP_COMMAND
#   APP_NAME
#   GIT_REPOSITORY
#
# Outputs:
#   Writes messages to stdout.
#######################################
function explain::self_update() {
  local helpful_tips=(
    "Update ${APP_NAME}, SonarQube & SonarScanner to the latest version:"
    "${APP_COMMAND} self-update"
  )

  explain::display_description \
    "Update ${APP_NAME} to the latest version."

  explain::display_usage "self-update"

  explain::display_helpful_tips "${helpful_tips[@]}"

  explain::display_more_information "${GIT_REPOSITORY}#self-update-command"
}
