# shellcheck shell=bash
#
# SonarQube DotEnv functions.

#######################################
# Load DotEnv file.
#
# Arguments:
#   DotEnv File
#######################################
function dotenv::load() {
  local file="${1}"
  local example="${file}.example"

  if [ ! -f "${file}" ]; then
    if [ ! -f "${example}" ]; then
      return
    fi

    cp "${example}" "${file}"
  fi

  # shellcheck source=/dev/null
  source "${file}"
}

#######################################
# Retrieve the environment variable.
#
# Arguments:
#   --file
#   --default
#   variable
#
# Outputs:
#   The variable value or the default
#   value.
#######################################
function dotenv::get() {
  local arguments_list=("file" "default")
  local default
  local file
  local variable="${*}"

  while [ $# -gt 0 ]; do
    if [[ "${1}" == *"--"* && "${1}" == *"="* ]]; then
      local argument="${1/--/}"
      IFS='=' read -ra parameter <<< "${argument}"

      if [[ "${arguments_list[*]}" =~ ${parameter[0]} ]]; then
        variable="${variable/--${argument}/}"
        declare "${parameter[0]}"="${parameter[1]}"
      fi
    fi

    shift
  done

  unset arguments_list

  if [[ -z "${file}" ]]; then
    dotenv::load "${file}"
  fi

  # Strip out whitespaces
  variable="${variable//[[:blank:]]/}"

  if [[ -z "${!variable}" ]]; then
    echo "${default}"
  else
    # Replace single quotes for double qoutes to support JSON variables.
    echo "${!variable//\'/\"/}"
  fi
}
