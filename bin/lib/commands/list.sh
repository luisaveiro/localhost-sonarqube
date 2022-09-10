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
#   Writes list of SonarScanner
#   properties files to stdout.
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
