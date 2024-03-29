# shellcheck shell=bash
#
# Localhost SonarQube publish command.

#######################################
# Publish SonarScanner properties file
# to a project directory.
#
# Globals:
#   APP_COMMAND
#
# Arguments:
#   User input
#
# Outputs:
#   Writes messages to stdout.
#
# Returns:
#   1 if properties file already exists
#   in directory or properties file
#   does not exist.
#######################################
function command::publish() {
  local project
  local properties_template
  local properties_template_name="default"
  local user_template="${1}"

  project="$( basename "$(pwd)" )"

  if filesystem::does_file_exists "$(pwd)/${SONARSCANNER_PROPERTIES_FILE}"; then
    console::warning --margin-bottom \
      "$(ansi --bold --white "${SONARSCANNER_PROPERTIES_FILE}") exists."

    console::output \
      "Unable to publish SonarScanner properties file because this project" \
      "($(ansi --bold --white "${project}")) already has a" \
      "$(ansi --bold --white "${SONARSCANNER_PROPERTIES_FILE}") file."

      exit 1
  fi

  # If user has provided template, replace template name.
  if [ -n "${user_template}" ]; then
    properties_template_name="${user_template}"
  fi

  properties_template="${TEMPLATE_DIR}/${properties_template_name}.properties"

  if ! filesystem::does_file_exists "${properties_template}"; then
    console::error --margin-bottom \
      "The $(ansi --bold --white "${properties_template_name}")" \
      "SonarScanner properties file does not exist."

    console::output \
      "To view a list of available SonarScanner properties files." \
      "Use the following command: $(ansi --bold --white "${APP_COMMAND} list")."

    exit 1
  fi

  cp "${properties_template}" "$(pwd)/${SONARSCANNER_PROPERTIES_FILE}"

  console::info --margin-bottom \
    "Published $(ansi --bold --white "${SONARSCANNER_PROPERTIES_FILE}") using" \
    "$(ansi --bold --white "${properties_template_name}")" \
    "SonarScanner properties file."

  console::output \
    "To scan your project source code with SonarScanner use the following" \
    "command: $(ansi --bold --white "${APP_COMMAND} scan")."
}

#######################################
# Display the helpful information for
# the publish command.
#
# Globals:
#   APP_COMMAND
#   GIT_REPOSITORY
#
# Outputs:
#   Writes messages to stdout.
#######################################
function explain::publish() {
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
