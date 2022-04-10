# shellcheck shell=bash
#
# SonarQube update shell command

#######################################
# Update Localhost Sonarqube to the latest version.
#
# Arguments:
#   --project_dir
#   --sonarqube
#   --sonarscanner
#
# Returns:
#   1 git checkout fails.
#######################################
function command::self_update() {
  local arguments_list=("project_dir" "sonarqube" "sonarscanner")
  local project_dir latest_tag sonarqube sonarscanner

  while [ $# -gt 0 ]; do
    if [[ $1 == *"--"* && $1 == *"="* ]]; then
      local argument="${1/--/}"

      IFS='=' read -ra parameter <<< "${argument}"

      if [[ "${arguments_list[*]}" =~ ${parameter[0]} ]]; then
        declare "${parameter[0]}"="${parameter[1]}"
      fi
    fi

    shift
  done

  info "[1/3] Updating $(ansi --bold --white SonarQube) Docker image ..."

  progressbar::start
  progressbar::half

  docker_compose::command --file="${sonarqube}" pull --quiet

  progressbar::finish --clear

  info --overwrite "[1/3] Updating $(ansi --bold --white SonarQube)" \
    "Docker image $(ansi --bold --white "[OK]")"

  if docker::is_container_running sonarqube; then
    notice --newline=top "SonarQube is running."
    output --newline=bottom "Please restart SonarQube to use new version."
  fi

  info "[2/3] Updating $(ansi --bold --white SonarScanner) Docker image ..."

  progressbar::start
  progressbar::half

  docker::pull --image="${sonarscanner}"

  progressbar::finish --clear

  info --overwrite "[2/3] Updating $(ansi --bold --white SonarScanner)" \
    "Docker image $(ansi --bold --white "[OK]")"

  if docker::is_container_running sonarscanner; then
    notice --newline=top "SonnarScanner is scanning a project."
    output --newline=bottom \
      "Current scan will use previous version of SonnarScanner."
  fi

  git::fetch --dir="${project_dir}"

  latest_tag="$(git::latest_tag --dir="${project_dir}")"

  info "[3/3] Updating $(ansi --bold --white Localhost SonarQube)" \
    "to $(ansi --bold --white "${latest_tag}") ..."

  progressbar::start
  progressbar::half
  progressbar::finish --clear

  info --overwrite "[3/3] Updating $(ansi --bold --white Localhost SonarQube)" \
    "to $(ansi --bold --white "${latest_tag}") $(ansi --bold --white "[OK]")"

  git::checkout --dir="${project_dir}" --branch="${latest_tag}"
}
