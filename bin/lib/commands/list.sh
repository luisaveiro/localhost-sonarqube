# shellcheck shell=bash
#
# Localhost SonarQube list command.

#######################################
# List available templates for
# SonarScanner properties.
#
# Globals:
#   APP_NAME
#   TEMPLATE_DIR
#
# Outputs:
#   Writes messages to stdout.
#######################################
function command::list() {
  local templates=()

  for template in "${TEMPLATE_DIR}"/*; do
    if [[ -d "${template}" ]]; then
      continue
    fi

    template="$( filesystem::file_name "${template}" )"
    templates+=("${template//.properties/}")
  done

  if [ "${#templates[@]}" -eq 1 ]; then
    console::info --margin-bottom \
      "$(ansi --bold --white "${APP_NAME}") has" \
      "$(ansi --bold --white "${#templates[@]}") SonarScanner properties file."

    console::output "The SonarScanner properties file that is available:"
  else
    console::info --margin-bottom \
      "$(ansi --bold --white "${APP_NAME}") has" \
      "$(ansi --bold --white "${#templates[@]}") SonarScanner properties files."

    console::output "The SonarScanner properties files that are available:"
  fi

  printf -- '- %s\n' "${templates[@]}"
}

#######################################
# Display the helpful information for
# the list command.
#
# Globals:
#   APP_COMMAND
#   GIT_REPOSITORY
#
# Outputs:
#   Writes messages to stdout.
#######################################
function explain::list() {
  local helpful_tips=(
    "List available SonarScanner properties files under sonarscanner-templates:"
    "${APP_COMMAND} list"
  )

  explain::display_description "List available SonarScanner properties files."

  explain::display_usage "list"

  explain::display_helpful_tips "${helpful_tips[@]}"

  explain::display_more_information "${GIT_REPOSITORY}#list-command"
}
