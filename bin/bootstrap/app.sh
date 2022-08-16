# shellcheck shell=bash
#
# Localhost SonarQube application.

#######################################
# The main function for Localhost
# SonarQube application.
#
# Globals:
#   APP_NAME
#
# Arguments:
#   User input
#
# Outputs:
#   Writes error messages to stdout.
#
# Returns:
#   1 if the OS is not supported or
#     dependencies are not installed.
#######################################
function main() {
  if ! os::is_supported; then
    console::error --margin-top \
      "Your OS is not supported. $(ansi --bold --white "${APP_NAME}")" \
      "supports macOS, Linux, and Windows (WSL2)."

    exit 1
  fi

  if ! os::has_installed docker; then
    console::error --margin-top --margin-bottom "Docker is not installed!"

    # Docker download URL.
    local url="https://www.docker.com/download"
    readonly url

    console::output \
      "$(ansi --bold --white "${APP_NAME}") requires Docker to run SonarQube" \
      "and SonarScanner Please installed Docker via" \
      "$(ansi --bold --white --underline "${url}")."

    exit 1
  fi

  if ! docker::is_docker_running; then
    console::error --margin-top --margin-bottom "Docker is not running!"

    console::output \
      "$(ansi --bold --white "${APP_NAME}") requires Docker to run SonarQube" \
      "and SonarScanner. Please start Docker daemon."

    exit 1
  fi

  sonarqube::console "$@"
}
