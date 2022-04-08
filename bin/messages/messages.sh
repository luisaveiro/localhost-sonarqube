# shellcheck shell=bash
#
# SonarQube status message

#######################################
# Output status message of SonarQube containers.
#
# Arguments:
#   url
#######################################
function message::status() {
  local url=$1

  if docker::is_container_running sonarqube; then
    info --newline=top "SonarQube is running on" \
      "$(ansi --bold --white "${url}")."

    output "To access SonarQube dashboard use the following command:"\
      "$(ansi --bold --white sonarqube dashboard)."
  else
    warning --newline=top "SonarQube is not running!"

    output "To start SonarQube use the following command:" \
      "$(ansi --bold --white sonarqube up)."
  fi
}

#######################################
# Output support Ukraine message to terminal.
#######################################
function message::supportUkraine() {
  hashtag="$(ansi --bold --white --bg-blue "#StandWith")"
  hashtag="${hashtag}$(ansi --bold --black --bg-yellow Ukraine)"

  output --newline=top "${hashtag}"

  quote="It's not enough that we do our best; sometimes we have to do what's required."
  output "$(ansi --italic "${quote}") — $(ansi --bold Winston Churchill)."

  output --newline=bottom "Support Ukraine by visiting" \
    "$(ansi --bold --white https://supportukrainenow.org)"
}
