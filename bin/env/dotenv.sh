# shellcheck shell=bash
#
# SonarQube DotEnv functions.

#######################################
# Load DotEnv file.
#
# Arguments:
#   DotEnv File
#
# Returns:
#   0 if the file does not exists.
#######################################
function dotenv::load() {
  local file="${1}"
  local example="${file}.example"

  if [ ! -f "${file}" ]; then
    if [ ! -f "${example}" ]; then
      return 0
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

#######################################
# Update an environment variable.
#
# Arguments:
#   --file
#   --variable
#   --value
#
# Returns:
#   1 if the file or variable does not
#   exists.
#######################################
function dotenv::set() {
  local arguments_list=("file" "variable" "value")
  local file
  local path
  local temp
  local variable
  local value

  while [ $# -gt 0 ]; do
    if [[ "${1}" == *"--"* && "${1}" == *"="* ]]; then
      local argument="${1/--/}"
      IFS='=' read -ra parameter <<< "${argument}"

      if [[ "${arguments_list[*]}" =~ ${parameter[0]} ]]; then
        declare "${parameter[0]}"="${parameter[1]}"
      fi
    fi

    shift
  done

  unset arguments_list

  if [ ! -f "${file}" ]; then
    return 1
  fi

  if ! grep -q "${variable}=" "${file}"; then
    return 1
  fi

  path="$( dirname "${file}" )"
  temp="${path}/tmp"

  sed "s/${variable}=.*/${variable}=${value}/g" "${file}" > "${temp}"; \
    cat "${temp}" > "${file}"; rm "${temp}"
}
