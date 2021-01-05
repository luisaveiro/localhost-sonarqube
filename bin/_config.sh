# Define variables...
WHITE='\033[1;37m'
NC='\033[0m'
DOCKER_COMPOSE_FILE="${CURRENT_DIR}/../docker/docker-compose.yml"
PROPERTIES_FILE="sonar-project.properties"
SONARQUBE_DASHBOARD_URL="http://localhost:9000"
SONARSCANNER_DOCKER_NETWORK="sonarqube-network"
SONARSCANNER_DOCKER_IMAGE="sonarsource/sonar-scanner-cli:latest"
