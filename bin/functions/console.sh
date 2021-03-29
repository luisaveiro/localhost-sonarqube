# shellcheck shell=bash
#
# Internal console functions used by the sonarqube commands.

#######################################
# Output error message to terminal.
#
# Arguments:
#   Message
#######################################
function error() {
  output "$(ansi --red ERROR:)" "$@"
}

#######################################
# Output info message to terminal.
#
# Arguments:
#   Message
#######################################
function info() {
  output "$(ansi --color=33 INFO:)" "$@"
}

#######################################
# Open url in the browser.
#
# Arguments:
#   Url
#######################################
function open_browser() {
  open "$1"
}

#######################################
# Output message to terminal.
#
# Arguments:
#   Message
#
# Outputs:
#   Writes message to stdout.
#######################################
function output() {
  echo -e "$@"
}

#######################################
# Output warning message to terminal.
#
# Arguments:
#   Message
#######################################
function warning() {
  output "$(ansi --yellow WARNING:)" "$@"
}
