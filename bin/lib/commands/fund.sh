# shellcheck shell=bash
#
# Localhost SonarQube fund command.

#######################################
# Display the Localhost SonarQube
# fund information.
#
# Globals:
#   GIT_REPOSITORY
#
# Outputs:
#   Writes fund information to stdout.
#######################################
function command::fund() {
  local buymeacoffee_url="https://www.buymeacoffee.com/luisaveiro"

  console::output --margin-bottom \
    "Do you like this project? 💖 Support it by donating."

  console::output \
    "$(ansi --bold --white "Buy me a coffee") ${buymeacoffee_url}"

  console::output \
    "$(ansi --bold --white "Star on GitHub ") ${GIT_REPOSITORY}"
}

#######################################
# Display helpful information for
# the fund command.
#
# Globals:
#   APP_COMMAND
#   APP_NAME
#   GIT_REPOSITORY
#
# Outputs:
#   Writes helpful information to
#   stdout.
#######################################
function explain::fund() {
  local helpful_tips=(
    "Discover how to help fund the maintenance ${APP_NAME}:"
    "${APP_COMMAND} fund"

    "Alternatively, you can use the support command:"
    "${APP_COMMAND} support"
  )

  explain::display_description \
    "Display ${APP_NAME} funding information."

  explain::display_usage "fund"

  explain::display_helpful_tips "${helpful_tips[@]}"

  explain::display_more_information "${GIT_REPOSITORY}#fund-command"
}
