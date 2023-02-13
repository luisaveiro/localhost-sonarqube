# shellcheck shell=bash
#
# Load Localhost SonarQube global configs.

#######################################
# Define Global Configs
#
# Filesystem config is a dependency for
# other configs. It must be loaded
# first.
#######################################

readonly CONFIGS=(
  "filesystem"
  "app"
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
  source "${BIN_DIR}/config/${CONFIG}.sh"
done
