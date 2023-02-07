# shellcheck shell=bash
#
# Localhost SonarQube internal console messaging functions.

#######################################
# Output the support message.
#
# Arguments:
#   Message
#
# Outputs:
#   Writes messages to stdout.
#######################################
function message::supportUkraine() {
  local hashtag
  local quote

  hashtag="$(ansi --bold --white --bg-blue "#StandWith")"
  hashtag+="$(ansi --bold --black --bg-yellow Ukraine)"

  quote="It's not enough that we do our best; "
  quote+="sometimes we have to do what's required."

  console::output --margin-top "${hashtag}"

  console::output \
    "$(ansi --italic "${quote}") — $(ansi --bold Winston Churchill)."

  console::output --margin-bottom \
    "Support Ukraine by visiting" \
    "$(ansi --bold --white "https://supportukrainenow.org")"
}
