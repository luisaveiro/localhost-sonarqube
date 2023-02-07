# shellcheck shell=bash
#
# Localhost SonarQube internal explain display sections functions.

#######################################
# Display the aliases for the command.
#
# Arguments:
#   Description
#
# Outputs:
#   Writes message to stdout.
#######################################
function explain::display_aliases() {
  console::output "$(ansi --bold --yellow Aliases:)"
  console::output --margin-bottom "  ${1}"
}

#######################################
# Display the arguments for the
# command.
#
# Arguments:
#   Arguments
#
# Outputs:
#   Writes message to stdout.
#######################################
function explain::display_arguments() {
  local tabs=15

  console::output "$(ansi --bold --yellow Arguments:)"

  printf "  $(ansi --green %-"${tabs}"s) %s\n" "$@"

  console::newline
}

#######################################
# Display the description for the
# command.
#
# Arguments:
#   Description
#
# Outputs:
#   Writes message to stdout.
#######################################
function explain::display_description() {
  console::output "$(ansi --bold --yellow Description:)"
  console::output --margin-bottom "  ${1}"
}

#######################################
# Display the helpful tips for the
# command.
#
# Arguments:
#   Helpful tips
#
# Outputs:
#   Writes message to stdout.
#######################################
function explain::display_helpful_tips() {
  local helpful_tips=("$@")

  console::output "$(ansi --bold --yellow Help:)"

  for (( index=0; index<${#helpful_tips[@]}; index+=2 )); do
    console::output --margin-bottom "  ${helpful_tips[index]}"
    console::output --margin-bottom \
      "    $(ansi --green "${helpful_tips[index+1]}")"
  done
}

#######################################
# Display the more information for the
# command.
#
# Arguments:
#   More Information URL
#
# Outputs:
#   Writes message to stdout.
#######################################
function explain::display_more_information() {
  console::output "  See $* for more information."
}

#######################################
# Display the options for the command.
#
# Arguments:
#   Options
#
# Outputs:
#   Writes message to stdout.
#######################################
function explain::display_options() {
  local tabs=13

  console::output "$(ansi --bold --yellow Options:)"

  printf "  $(ansi --green %-"${tabs}"s) %s\n" "$@"

  console::newline
}

#######################################
# Display the usage for the command.
#
# Arguments:
#   Description
#
# Outputs:
#   Writes message to stdout.
#######################################
function explain::display_usage() {
  console::output "$(ansi --bold --yellow Usage:)"
  console::output --margin-bottom "  ${1}"
}
