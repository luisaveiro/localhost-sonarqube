# shellcheck shell=bash
#
# Localhost SonarQube port command.

#######################################
# Set the SonarQube dashboard port.
#
# Globals:
#   DOTENV
#   SONARQUBE_DASHBOARD_URL
#
# Arguments:
#   User input
#
# Outputs:
#   Writes messages to stdout.
#######################################
function command::port() {
  local dashboard_url="${SONARQUBE_DASHBOARD_URL}"
  local port="${1}"

  if [[ -z "${port}" ]]; then
    console::error "Please provide preferred port."

    exit 1
  fi

  if sonarqube::is_running; then
    console::error --margin-bottom "SonarQube is running!"

    console::output \
      "You can not change SonarQube dashboard port while SonarQube is" \
      "running. Please stop SonarQube before changing the port."

    exit 1
  fi

  if
    ! dotenv::set --file="${DOTENV}" --variable="SONARQUBE_PORT" --value="${port}"
  then
    console::error "Unable to update SonarQube dashboard port."

    exit 1
  fi

  console::info --margin-bottom "SonarQube dashboard port is updated."

  dashboard_url="${dashboard_url/${SONARQUBE_PORT}/${port}}"

  console::output \
    "When you start SonarQube the dashboard will run on:" \
    "$(ansi --bold --white "${dashboard_url}")."
}

#######################################
# Display the helpful information for
# the port command.
#
# Globals:
#   APP_COMMAND
#   GIT_REPOSITORY
#
# Outputs:
#   Writes messages to stdout.
#######################################
function explain::port() {
  local arguments=(
    "port-number"
    "The port number $(ansi --yellow "[default: \"9000\"]")."
  )

  local helpful_tips=(
    "Update SonarQube dashboard to run on a specific port:"
    "${APP_COMMAND} port [<port-number>]"
  )

  explain::display_description \
    "Set SonarQube dashboard port."

  explain::display_usage "port [<port-number>]"

  explain::display_arguments "${arguments[@]}"

  explain::display_helpful_tips "${helpful_tips[@]}"

  explain::display_more_information "${GIT_REPOSITORY}#port-command"
}
