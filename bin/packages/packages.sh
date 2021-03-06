# shellcheck shell=bash
#
# Simple package manager to load third-party packages.

readonly PACKAGES_DIR="${CURRENT_DIR}/packages"

readonly PACKAGES=(
  "ansi/ansi.sh"
  "docker/docker.sh"
  "docker_compose/docker_compose.sh"
  "git/git.sh"
  "help/help.sh"
)

for package in "${PACKAGES[@]}"
do
  # shellcheck source=/dev/null
  source "${PACKAGES_DIR}/${package}"
done

