# shellcheck shell=bash
#
# SonarQube update shell command

#######################################
# Update Localhost Sonarqube to the latest version.
#
# Arguments:
#   --project_dir
#######################################
function command::self_update() {
  local project_dir latest_tag

  while [ $# -gt 0 ]; do
    if [[ $1 == *"--project_dir="* ]]; then
      local argument="${1/--/}"

      IFS='=' read -ra parameter <<< "${argument}"

      declare "${parameter[0]}"="${parameter[1]}"
    fi

    shift
  done

  git::fetch --dir="${project_dir}"

  latest_tag="$(git::latest_tag --dir="${project_dir}")"

  info "Updating $(ansi --bold --white Localhost SonarQube) to" \
    "$(ansi --bold --white "${latest_tag}")."

  _=$(cd "${project_dir}" && git checkout "${latest_tag}" 2>&1)
}
