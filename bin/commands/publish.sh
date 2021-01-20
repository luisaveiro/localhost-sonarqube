# shellcheck shell=bash
#
# SonarQube publish shell command

#######################################
# Publish SonarScanner properties file to a project directory.
#
# Globals:
#   PROPERTIES_FILE
#   WHITE
#   NC
#   CURRENT_DIR
#
# Arguments:
#   Template name
#
# Outputs:
#   Writes message to stdout.
#
# Returns:
#   1 if properties file already exists in directory or properties file does not exist.
#######################################
function command::publish() {
  if ! project_configuration_exists "${PROPERTIES_FILE}"; then
    output "${WHITE}Unable to publish configuration template because this project already has ${PROPERTIES_FILE}.${NC}"

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

  if configuration_template_exists "${properties_template}"; then
    output "Configuration template ${WHITE}${properties_template_name}${NC} does not exist."

    exit 1
  fi

  publish_configuration "${properties_template}" "$(pwd)/${PROPERTIES_FILE}"
  output "${WHITE}Published ${PROPERTIES_FILE} using ${properties_template_name} template.${NC}"
}
