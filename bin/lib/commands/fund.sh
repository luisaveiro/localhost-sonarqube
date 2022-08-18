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
