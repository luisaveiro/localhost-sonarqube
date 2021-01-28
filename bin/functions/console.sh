# shellcheck shell=bash
#
# Internal console functions used by the sonarqube commands.

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
# Output error message to terminal.
#
# Arguments:
#   Message
#######################################
function error() {
  output "$(ansi --red ERROR:) ${1}"
}

#######################################
# Output info message to terminal.
#
# Arguments:
#   Message
#######################################
function info() {
  output "$(ansi --white INFO:) ${1}"
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
  echo -e "$1"
}

#######################################
# Output warning message to terminal.
#
# Arguments:
#   Message
#######################################
function warning() {
  output "$(ansi --yellow WARNING:) ${1}"
}
