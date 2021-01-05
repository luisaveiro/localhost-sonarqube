source "${CURRENT_DIR}/_functions.sh"

# Open SonarQube dashboard in the browser.
function dashboard() {
    __open_sonarqube_dashboard ${SONARQUBE_DASHBOARD_URL}
    __output "Opening SonarQube dashboard on ${WHITE}${SONARQUBE_DASHBOARD_URL}.${NC}"
}

# Stop SonarQube Docker containers.
function down() {
    __run_docker_compose ${DOCKER_COMPOSE_FILE} down
}

# Publish SonarScanner properties file to a project directory.
function publish() {
    __project_configuration_exists ${PROPERTIES_FILE}

    if [ $? == 1 ]; then
        __output "${WHITE}Unable to publish configuration template because this project already has ${PROPERTIES_FILE}.${NC}"
        
        exit 1
    fi

    # Set default template.
    _PROPERTIES_TEMPLATE_NAME="default"

    # If user has provided template, replace template name.
    if [ "$1" != "" ]; then
        _PROPERTIES_TEMPLATE_NAME=$1
    fi

    _PROPERTIES_TEMPLATE="${CURRENT_DIR}/../sonarscanner-templates/${_PROPERTIES_TEMPLATE_NAME}.properties"

    __configuration_template_exists ${_PROPERTIES_TEMPLATE}

    if [ $? == 0 ]; then
        __output "Configuration template ${WHITE}${_PROPERTIES_TEMPLATE_NAME}${NC} does not exist."

        exit 1
    fi

    __publish_configuration ${_PROPERTIES_TEMPLATE} "$(pwd)/${PROPERTIES_FILE}"
    __output "${WHITE}Published ${PROPERTIES_FILE} using ${_PROPERTIES_TEMPLATE_NAME} template.${NC}"
}

# Scan project source code with SonarScanner.
function scan() {
    __project_configuration_exists ${PROPERTIES_FILE}

    if [ $? == 0 ]; then
        __output "Add ${WHITE}${PROPERTIES_FILE}${NC} before running SonarScanner."
        __output "Use the following commands: ${WHITE}sonarqube publish${NC} or ${WHITE}sonarqube publish <template>${NC}."

        exit 1
    fi

    __scan_project ${SONARSCANNER_DOCKER_IMAGE} ${SONARSCANNER_DOCKER_NETWORK}
}

# Start SonarQube Docker containers.
function up() {
    __run_docker_compose ${DOCKER_COMPOSE_FILE} up -d
}
