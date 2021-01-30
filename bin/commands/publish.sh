# shellcheck shell=bash
#
# SonarQube publish shell command

#######################################
# Publish SonarScanner properties file to a project directory.
#
# Arguments:
#   --properties_file
#   --template_dir
#   User template name
#
# Returns:
#   1 if properties file already exists in directory or properties file does not exist.
#######################################
function command::publish() {
  local properties_file template_dir user_template
  local properties_template_name="default"

  user_template=$*

  while [ $# -gt 0 ]; do
    if [[ $1 == *"--"* ]] && [[ $1 == *"="* ]]; then
      local argument="${1/--/}"
      user_template="${user_template/--${argument}/}"

      IFS='=' read -ra parameter <<< "${argument}"

      declare "${parameter[0]}"="${parameter[1]}"
    fi

    shift
  done

  # Strip out whitespaces
  user_template="${user_template//[[:blank:]]/}"

  if file_exists "$(pwd)/${properties_file}"; then
    warning "Unable to publish configuration template because this project already has $(ansi --bold --white "${properties_file}")."

    exit 1
  fi

  # If user has provided template, replace template name.
  if [ "${user_template}" != "" ]; then
    properties_template_name=$user_template
  fi

  # local properties_template
  properties_template="${template_dir}/${properties_template_name}.properties"

  if ! file_exists "${properties_template}"; then
    error "Configuration template $(ansi --bold --white "${properties_template_name}") does not exist."

    exit 1
  fi

  cp "${properties_template}" "$(pwd)/${properties_file}"
  info "Published $(ansi --bold --white "${properties_file}") using $(ansi --bold --white "${properties_template_name}") template."
}
