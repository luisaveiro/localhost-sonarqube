# shellcheck shell=bash
#
# Localhost SonarQube internal help (usage) functions.

#######################################
# Store the command and description for
# help output.
#
# Globals:
#   HELP_COMMAND_LIST
#   HELP_COMMAND_TEXT_MAX_LENGTH
#
# Arguments:
#   --command
#   --description
#######################################
function help::add_command() {
  local arguments_list=("command" "description")
  local command
  local description

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

  if [ ${#command} -gt "${HELP_COMMAND_TEXT_MAX_LENGTH}" ]; then
    help::set_command_text_max_length ${#command}
  fi

  HELP_COMMAND_LIST+=("${command}" "${description}")
}

#######################################
# Display the help project contribution
# message.
#
# Arguments:
#   --package_name
#   --package_url
#
# Outputs:
#   Writes the project contribution
#   message to stdout.
#######################################
function help::contribute() {
  local arguments_list=("package_name" "package_url")
  local package_name
  local package_url

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

  console::output \
    "- Star or contribute to ${package_name}:"

  console::output --margin-bottom \
    "  $(ansi --bold --white "${package_url}")"
}

#######################################
# Display the list of available
# commands and description.
#
# Globals:
#   HELP_COMMAND_LIST
#   HELP_COMMAND_TEXT_MAX_LENGTH
#   HELP_DESCRIPTION_SPACING
#
# Outputs:
#   Writes the available commands
#   and description to stdout.
#######################################
function help::display_commands() {
  local tabs=0

  tabs="$((HELP_COMMAND_TEXT_MAX_LENGTH + HELP_DESCRIPTION_SPACING))"

  console::output "$(ansi --bold --yellow "Available commands:")"

  printf "  $(ansi --green %-"${tabs}"s) %s\n" "${HELP_COMMAND_LIST[@]}"
}

#######################################
# Display the command usage message.
#
# Arguments:
#   --command_name
#   --has-arguments
#   --has-options
#
# Outputs:
#   Writes the command usage to stdout.
#######################################
function help::display_usage() {
  local arguments_list=("command_name" "has-arguments" "has-options")
  local command_name
  local has_arguments=false
  local has_options=false
  local extras=()

  while [ $# -gt 0 ]; do
    if [[ $1 == *"--"* && $1 == *"="* ]]; then
      local argument="${1/--/}"
      IFS='=' read -ra parameter <<< "${argument}"

      if [[ "${arguments_list[*]}" =~ ${parameter[0]} ]]; then
        declare "${parameter[0]}"="${parameter[1]}"
      fi
    else
      local argument="${1/--/}"

      if [[ "${arguments_list[*]}" =~ ${argument} ]]; then
        declare "${argument//-/_}"=true
      fi
    fi

    shift
  done

  if [[ "${has_arguments}" == true ]]; then
    extras+=("[arguments]")
  fi

  if [[ "${has_options}" == true ]]; then
    extras+=("[options]")
  fi

  console::output "$(ansi --bold --yellow Usage:)"
  console::output --margin-bottom \
    "$(ansi --bold --white "${command_name}" command) ${extras[*]}"
}

#######################################
# Display the useful tips.
#
# Arguments:
#   --command_name
#
# Outputs:
#   Writes the useful tips to stdout.
#######################################
function help::display_useful_tips() {
  local command_name

  while [ $# -gt 0 ]; do
    if [[ "${1}" == *"--command_name"* ]]; then
      command_name="${1/--command_name=/}"
    fi

    shift
  done

  console::output --margin-top "More configuration info:" \
    "$(ansi --bold --white "${command_name} help [command]")"
}

#######################################
# Set the command max character length.
#
# Globals:
#   HELP_COMMAND_TEXT_MAX_LENGTH
#
# Arguments:
#   length
#######################################
function help::set_command_text_max_length() {
  HELP_COMMAND_TEXT_MAX_LENGTH="${1}"
}

#######################################
# Set description max tabs spacing.
#
# Globals:
#   HELP_DESCRIPTION_SPACING
#
# Arguments:
#   length
#######################################
function help::set_description_spacing() {
  HELP_DESCRIPTION_SPACING="${1}"
}

#######################################
# Display the help tagline.
#
# Arguments:
#   Tagline
#
# Outputs:
#   Writes the tagline to stdout.
#######################################
function help::tagline() {
  console::output --margin-bottom "$(ansi --italic "${*}")"
}

#######################################
# Display the help title.
#
# Globals:
#   PROJECT_DIR
#
# Arguments:
#   Title
#
# Outputs:
#   Writes the title to stdout.
#######################################
function help::title() {
  console::output "$(ansi --bold --white "${*}") -" \
    "$(git::active_branch --dir="${PROJECT_DIR}")"
}
