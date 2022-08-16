# shellcheck shell=bash
#
# Load Localhost SonarQube global configs.

#######################################
# Define Global Configs
#######################################

readonly CONFIGS=(
  "app"
  "filesystem"
  "docker_compose"
  "git"
  "help"
  "sonarqube"
  "sonarscanner"
)

#######################################
# Load Global Configs
#######################################

for CONFIG in "${CONFIGS[@]}"; do
  # shellcheck source=/dev/null
  source "${CURRENT_DIR}/config/${CONFIG}.sh"
done
