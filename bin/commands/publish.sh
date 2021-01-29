# shellcheck shell=bash
#
# SonarQube publish shell command

#######################################
# Publish SonarScanner properties file to a project directory.
#
# Globals:
#   PROPERTIES_FILE
#   CURRENT_DIR
#
# Arguments:
#   Template name
#
# Returns:
#   1 if properties file already exists in directory or properties file does not exist.
#######################################
function command::publish() {
  if file_exists "$(pwd)/${PROPERTIES_FILE}"; then
    warning "Unable to publish configuration template because this project already has $(ansi --bold --white "${PROPERTIES_FILE}")."

    exit 1
  fi

  # Set default template.
  local properties_template_name
  properties_template_name="default"

  # If user has provided template, replace template name.
  if [ "$1" != "" ]; then
    properties_template_name=$1
  fi

  local properties_template
  properties_template="${CURRENT_DIR}/../sonarscanner-templates/${properties_template_name}.properties"

  if ! file_exists "${properties_template}"; then
    error "Configuration template $(ansi --bold --white "${properties_template_name}") does not exist."

    exit 1
  fi

  cp "${properties_template}" "$(pwd)/${PROPERTIES_FILE}"
  info "Published $(ansi --bold --white "${PROPERTIES_FILE}") using $(ansi --bold --white "${properties_template_name}") template."
}
