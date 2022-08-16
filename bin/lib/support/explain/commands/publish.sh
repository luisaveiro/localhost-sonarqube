# shellcheck shell=bash
#
# Localhost SonarQube internal explain helper functions.

#######################################
# Display helpful information for
# the publish command.
#
# Globals:
#   APP_COMMAND
#   GIT_REPOSITORY
#
# Outputs:
#   Writes helpful information to
#   stdout.
#######################################
function explain::command_publish() {
  local arguments=(
    "template-name"
    "The template name $(ansi --yellow "[default: \"default\"]")."
  )

  local helpful_tips=(
    "To publish the default SonarScanner properties file:"
    "${APP_COMMAND} publish"

    "To publish a specific SonarScanner properties file:"
    "${APP_COMMAND} publish [<template-name>]"
  )

  explain::display_description \
    "Publish SonarScanner properties file to a project directory."

  explain::display_usage "publish [<template-name>]"

  explain::display_arguments "${arguments[@]}"

  explain::display_helpful_tips "${helpful_tips[@]}"

  explain::display_more_information "${GIT_REPOSITORY}#publish-command"
}
