# shellcheck shell=bash
#
# Package with helpful git commands.

#######################################
# Get the latest Git tag.
#
# Arguments:
#   --dir
#
# Outputs:
#   git latest tag.
#######################################
function git::latest_tag() {
  local dir git_sub_command

  while [ $# -gt 0 ]; do
    if [[ $1 == *"--dir="* ]]; then
      local argument="${1/--/}"

      IFS='=' read -ra parameter <<< "${argument}"

      declare "${parameter[0]}"="${parameter[1]}"
    fi

    shift
  done

  if directory_exists "${dir}/.git"; then
    git_sub_command="$(cd "${dir}" && git rev-list --tags --max-count=1)"

    echo -e "$(cd "${dir}" && git describe --tags "$git_sub_command")"
  else
    echo "unreleased"
  fi
}
