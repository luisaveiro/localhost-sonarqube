# shellcheck shell=bash
#
# Localhost SonarQube Command Line Interface (CLI).

#######################################
# The Localhost SonarQube CLI.
#
# Globals:
#   APP_COMMAND
#
# Arguments:
#   User input
#
# Outputs:
#   Writes messaging to stdout.
#
# Returns:
#   1 if the command is not supported.
#######################################
function sonarqube::console() {
  local exclude_commands=("about" "config" "version")

  if [ $# == 0 ]; then
    message::supportUkraine
    command::usage

    exit 0
  fi

  for argument in "$@"; do
    shift
    case "${argument}" in
      -v|--version)
        command::version
        break;;
      -h|--help)
        command::usage
        break;;
      *)
        local sonarqube_command="command::${argument//-/_}"

        if [[ $( type -t "${sonarqube_command}" ) != function ]]; then
          console::error --margin-top --margin-bottom \
            "Command $(ansi --bold --white "${argument}" ) is not supported."

          console::output \
            "To view a list of all available commands use the following:" \
            "$(ansi --bold --white "${APP_COMMAND} --help")"

          exit 1
        fi

        if [[ "${exclude_commands[*]}" != *"${argument}"* ]]; then
          message::supportUkraine
        fi

        # Execute the Localhost SonarQube command.
        "${sonarqube_command}" "$@"

        break;;
    esac
  done
}
