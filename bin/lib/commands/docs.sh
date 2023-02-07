# shellcheck shell=bash
#
# Localhost SonarQube docs command.

#######################################
# Display the Localhost SonarQube docs
# information.
#
# Globals:
#   APP_NAME
#   GIT_REPOSITORY
#   PROJECT_DIR
#
# Arguments:
#   User input
#
# Outputs:
#   Writes messages to stdout.
#######################################
function command::docs() {
  local label="readme"
  local docs_url
  local readme_url
  local version
  local wiki_url

  version="$(git::active_branch --dir="${PROJECT_DIR}")"
  readme_url="${GIT_REPOSITORY}/blob/${version}/README.md"
  wiki_url="${GIT_REPOSITORY}/wiki"
  docs_url="${readme_url}"

  console::output --margin-bottom "${APP_NAME} documentation:"

  console::output "$(ansi --bold --white "- Readme")" "${readme_url}"
  console::output "$(ansi --bold --white "- Wiki  ")" "${wiki_url}"

  # loop through user input.
  for argument in "$@"; do
    shift
    case "${argument}" in
      --wiki)
        label="wiki"
        docs_url="${wiki_url}"
        break;;
    esac
  done

  console::info --margin-top \
    "Opening the ${label} (${version}) to: $(ansi --bold --white "${docs_url}")"

  browser::open "${docs_url}"
}

#######################################
# Display the helpful information for
# the docs command.
#
# Globals:
#   APP_COMMAND
#   APP_NAME
#   GIT_REPOSITORY
#
# Outputs:
#   Writes messages to stdout.
#######################################
function explain::docs() {
  local helpful_tips=(
    "To open the docs URL in your default browser:"
    "${APP_COMMAND} docs"

    "To open the wiki URL in your default browser use the \"--wiki\" option:"
    "${APP_COMMAND} docs --wiki"

    "The wiki command is an alias for the docs command with the --wiki option:"
    "${APP_COMMAND} wiki"
  )

  local options=(
    "--wiki" "Open ${APP_ANME} GitHub wiki in the browser."
  )

  explain::display_description \
    "Open ${APP_NAME} documentation in your default browser."

  explain::display_usage "docs [options]"

  explain::display_options "${options[@]}"

  explain::display_helpful_tips "${helpful_tips[@]}"

  explain::display_more_information "${GIT_REPOSITORY}#docs-command"
}
