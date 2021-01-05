# Check if requested configuration template exists.
function __configuration_template_exists() {
    _PROPERTIES_TEMPLATE_FILE=$1

    if [ -f "${_PROPERTIES_TEMPLATE_FILE}" ]; then
        return 1
    fi

    return 0
}

# Check if docker is running on machine.
function __is_docker_running() {
    if ! docker info > /dev/null 2>&1; then
        __output "${WHITE}Docker is not running. Please run Docker desktop.${NC}"

        exit 1
    fi
}

# Check if operating system is either macOS, Linux, and Windows.
function __is_operating_system_supported() {
    _UNAMEOUT="$(uname -s)"

    case $_UNAMEOUT in
        Linux*)
            _MACHINE=Linux;;
        Darwin*)
            _MACHINE=mac;;
        *)
            _MACHINE="UNKNOWN";;
    esac

    if [ $_MACHINE == "UNKNOWN" ]; then
        __output "${WHITE}Unsupported OS [${_UNAMEOUT}]. Docker supports macOS, Linux, and Windows (WSL2).${NC}"
    
        exit 1
    fi
}

# Check if SonarQube Docker containers are running.
function __is_sonarqube_docker_containers_running() {
    if [ "$(docker ps -q -f name=sonarqube)" ]; then
        return 1
    fi
    
    return 0
}

# Open SonarQube dashboard in the browser.
function __open_sonarqube_dashboard() {
    open $1
}

# Output message to terminal.
function __output() {
    echo -e $1
}

# Check if properties file exist in current directory.
function __project_configuration_exists() {
    _PROPERTIES_FILE=$1

    if [ -f "$(pwd)/${_PROPERTIES_FILE}" ]; then
        return 1
    fi

    return 0
}

# Copy SonarScanner properties file to a project directory.
function __publish_configuration() {
    _PROPERTIES_TEMPLATE_FILE=$1
    _PROPERTIES_TEMPLATE_FILE_DESTINATION=$2

    cp ${_PROPERTIES_TEMPLATE_FILE} ${_PROPERTIES_TEMPLATE_FILE_DESTINATION}
}

# Execute Docker compose CLI command.
function __run_docker_compose() {
    _DOCKER_COMPOSE_FILE=$1
    _DOCKER_COMPOSE_COMMAND=$2

    docker-compose -f ${_DOCKER_COMPOSE_FILE} ${_DOCKER_COMPOSE_COMMAND} $3
}

# Scan Projet using SonarScanner in a Docker container.
function __scan_project() {
    _DOCKER_NETWORK=$2
    _SONARSCANNER_DOCKER_IMAGE=$1

    docker run \
        --network=${_DOCKER_NETWORK} \
        -it --rm \
        -v "$(pwd):/usr/src" \
        ${_SONARSCANNER_DOCKER_IMAGE}
}
