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
#   Writes docs information to stdout.
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
