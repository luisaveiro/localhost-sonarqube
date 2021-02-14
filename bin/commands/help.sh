# shellcheck shell=bash
#
# SonarQube help shell command.

#######################################
# Display help section
#
# Arguments:
#   --project_dir
#######################################
function command::help() {
  local project_dir

  while [ $# -gt 0 ]; do
    if [[ $1 == *"--"* && $1 == *"="* ]]; then
      local argument="${1/--/}"

      IFS='=' read -ra parameter <<< "${argument}"

      declare "${parameter[0]}"="${parameter[1]}"
    fi

    shift
  done

  output "$(ansi --bold --white Localhost SonarQube)" \
    "$(git::latest_tag --dir="${project_dir}")"

  help::boilerplate

  local commands=(
    "dashboard"
    "down"
    "publish"
    "scan"
    "up"
  )

  local descriptions=(
    "Open SonarQube dashboard in the browser"
    "Stop SonarQube Docker containers"
    "Publish SonarScanner properties file to a project directory"
    "Scan project source code with SonarScanner"
    "Start SonarQube Docker containers"
  )

  for index in "${!commands[@]}"
  do
    help::add_command \
      --command="${commands[index]}" \
      --description="${descriptions[index]}"
  done

  help::display_commands
}
