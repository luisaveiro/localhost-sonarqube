# shellcheck shell=bash
#
# Help package.

HELP_COMMANDS=()
HELP_COMMAND_MAX_LENGTH=0
HELP_COMMAND_TABS=4

#######################################
# Store command and description for help output.
#
# Globals:
#   HELP_COMMANDS
#
# Arguments:
#   --command
#   --description
#######################################
function help::add_command() {
  local arguments_list=("command" "description")
  local command description

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

  if [ ${#command} -gt "${HELP_COMMAND_MAX_LENGTH}" ]; then
    HELP_COMMAND_MAX_LENGTH=${#command}
  fi

  HELP_COMMANDS+=("${command}" "${description}")
}

#######################################
# Display help boilerplate section.
#######################################
function help::boilerplate() {
  output "\n$(ansi --bold --yellow Usage:)"
  output "  command [options]\n"
  output "$(ansi --bold --yellow Available commands:)"
}

#######################################
# Display Lists of commands.
#
# Globals:
#   HELP_COMMANDS
#######################################
function help::display_commands() {
  local tabs
  tabs=$((HELP_COMMAND_MAX_LENGTH + HELP_COMMAND_TABS))

  printf "  $(ansi --green %-"${tabs}"s) %s\n" "${HELP_COMMANDS[@]}"
}

#######################################
# Display help section.
#
# Globals:
#   HELP_COMMANDS
#
# Arguments:
#   Text
#######################################
function help::section() {
  unset HELP_COMMANDS

  output " $(ansi --yellow "${1}":)"
}
