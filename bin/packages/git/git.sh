# shellcheck shell=bash
#
# Package with helpful git commands.

#######################################
# Git checkout
#
# Arguments:
#   --dir
#   --branch
#
# Returns:
#   1 git checkout fails.
#   0 git checkout successful.
#######################################
function git::checkout() {
  local arguments_list=("dir" "branch")
  local dir branch

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

  command=$(cd "${dir}" && git checkout "${branch}" 2>&1)

  [[ -n $command ]] && return 1 || return 0
}

#######################################
# Git fetch
#
# Arguments:
#   --dir
#######################################
function git::fetch() {
  local dir

  while [ $# -gt 0 ]; do
    if [[ $1 == *"--dir="* ]]; then
      local argument="${1/--/}"
      IFS='=' read -ra parameter <<< "${argument}"

      declare "${parameter[0]}"="${parameter[1]}"
    fi

    shift
  done

  _=$(cd "${dir}" && git fetch --all 2>&1)
}

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
