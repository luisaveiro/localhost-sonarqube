# Changelog
All notable changes to `luisaveiro/localhost-sonarqube` will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- DotEnv support.
- DotEnv example file.
- `DOTENV` & `SONARQUBE_PORT` global constant.
- `port` command to update SonarQube service port.

### Changed
- SonarQube service host port to be configurable via DotEnv.
- Clean up `docs` command.

### Fixed
- config file ordering.

## [v1.0.6] - 2023-02-07
### Added
- TL;DR section in Readme.

### Fixed
- Code formatting.
- Clean up doc-blocks.

### Removed
- Unnecessary code for function parameters checking.

## [v1.0.5] - 2023-01-25
### Fixed
- SonarQube not running on Apple Silicon (M1/M2).

## [v1.0.4] - 2023-01-15
### Changed
- Renamed Docker Compose files to follow compose specifications.
- Readme to adopt Compose V2 specifications.

## [v1.0.3] - 2023-01-03
### Changed
- Refactor the explain commands.

## [v1.0.2] - 2022-09-10
### Changed
- `CURRENT_DIR` to `BIN_DIR`.
- use Bash "is not empty" argument.

### Fixed
- Formatting.
- `list` command `printf` formatting.
- Typos in doc-blocks.
- ShellCheck Docker image tag.

## [v1.0.1] - 2022-08-18
### Changed
- The lib dependencies array to be readonly.

### Fixed
- Typos in doc-blocks.
- The list command console output messages.
- Formatting.
- Corrected the naming convention for `help::display_usage` option parameters.

### Removed
- Redundant code for publish command.

## [v1.0.0] - 2022-08-16
### Added
- `about` command to display a short information about Localhost SonarQube.
- `analyse` alias command for `scan` command.
- `config` command to display Docker Compose config.
- `docs` command to open Localhost SonarQube documentation in the browser.
- `fund` command to display Localhost SonarQube funding information.
- `list` command to list available SonarScanner properties files,
- `restart` command to restart SonarQube Docker containers.
- `start` alias command for `up` command
- `status` command to display the status of SonarQube & SonarScanner containers.
- `stop` alias command for `down` command.
- `support` alias command for `support` command.
- `usage` command to display a list of all available commands.
- `version` command to display Localhost SonarQube installed version.
- `wiki` alias command for `docs` command.

### Changed
- Refactor the Localhost SonarQube codebase.
- All functions of Localhost SonarQube codebase are in `lib` directory.
- All functions of Localhost SonarQube codebase are namespaced.
- Moved global config constants into `config` directory.
- `help` command displays help information for a command instead of list of all available commands.
- Improved format of `error`, `info`, `notice` & `warning` messages.
- Use Blacksmith Engineers forked version of [ANSI Code Generator](https://github.com/blacksmith-engineers/ansi)
- `packages` directory to store third-party packages.

### Fixed
- `sonarqube` being sourced. Localhost SonarQube is executed in a new shell process.
- The `scan` command could only scan one project at a time.

## [v0.6.1] - 2022-04-10
### Fixed
- `self-update` command output messages.

## [v0.6.0] - 2022-04-10
### Added
- `progressbar` package.
- `docker::pull` command to update Docker images.
- `git::checkout` function to `git` package.
- `notice` log output functions.
- `messages` namespace for repeatable output messages
- A status message of SonarQube containers after executing `down` & `up` commands.

### Changed
- `self-update` command updates SonarQube and SonarScanner Docker images.
- SonarScanner container has a predefined name.
- `output` function supports `--overwrite` argument.
- Improved output messages.

### Fixed
- SonarScanner throwing an error if SonarQube is not running.

## [v0.5.0] - 2022-04-04
### Added
- Support Ukraine message to terminal and readme.
- `newline` function

### Changed
- `output` function accepts new `--newline` argument.
- Improved format of output messages.

## [v0.4.3] - 2021-11-11
### Added
- ShellCheck for Visual Studio Code.

### Fixed
- Problematic code in the case of readonly ([ShellCheck SC2155](https://github.com/koalaman/shellcheck/wiki/SC2155)).

## [v0.4.2] - 2021-04-15
### Changed
- `self-update` command git output to throwaway variable.
- `git::fetch` function output to standard output and error.

## [v0.4.1] - 2021-04-15
### Added
- `git::fetch` function to `git` package.

### Fixed
- `self-update` command.

## [v0.4.0] - 2021-03-29
### Added
- Scan command include cache volume for scanner files.
- `PROJECT_NAME` global constant.
- Self update command.
- Self update section in readme.
- Scan command caches scanner files.

## Changed
- `docker_compose::command` command accepts project name and set an alternate project name.
- `docker::run` command accepts multiple volumes.
- Info output prefix colour from white to blue.

## [v0.3.1] - 2021-03-28
### Fixed
- Prevent Docker Compose to prefix volume names with "docker_" during `docker-compose up`.
- Prevent functions declaring variables from unwanted arguments.

## [v0.3.0] - 2021-02-14
### Added
- `directory_exists` filesystem function.
- Help and Git package.
- Help command.
- Help section in readme.

### Changed
- `PROJECT_DIR` global constant to be exportable.

## [v0.2.2] - 2021-02-11
### Changed
- Improve formatting to be more in line with [Google Shell Style Guide](https://google.github.io/styleguide/shellguide.html).
- `error`, `info`, `warning`, `output` log output functions accept multiple arguments.

## [v0.2.1] - 2021-01-30
### Fixed
- `option` parameters differentiation for functions.

## [v0.2.0] - 2021-01-29

### Added
- [ANSI Code Generator](https://github.com/fidian/ansi) to improve CLI messages.
- `error`, `info`, `warning` log output functions.
- Docker compose package
- Docker package
- `PROJECT_DIR` & `TEMPLATE_DIR` global constants

### Changed
- Shell scripts to use `error`, `info`, `warning` log output functions to improve CLI messages.
- Change `sonarqube up` & `sonarqube down` commands to use docker compose package.
- Renamed `open_sonarqube_dashboard` function to `open_browser`.
- Replaced `configuration_template_exists` & `project_configuration_exists` with `file_exists`.
- Change `sonarqube publish` & `sonarqube scan` commands to use `file_exists` function.
- Shell scripts to use docker package.
- Commands and functions shell script to follow package structure.
- Commands to follow better functional programming principles.

### Fixed
- Fixed `sonar.host.url` for SonarScanner template [#5](https://github.com/luisaveiro/localhost-sonarqube/issues/5).

### Removed
- Global `WHITE` & `NC` constants from config.
- Unused `up` & `down` command scripts.
- `run_docker_compose` function.
- `publish_configuration` function.
- Unused `docker` function script.

## [v0.1.2] - 2021-01-20
### Added
- Laravel SonarScanner template.
- Useful Tips section in readme.
- Test coverage & execution properties for default and laravel SonarScanner templates.

### Fixed
- Fixed `sonar.host.url` for default SonarScanner template.

## [v0.1.1] - 2021-01-15
### Added
- EditorConfig file.

### Changed
- Shell scripts to adopt [Google Shell Style Guide](https://google.github.io/styleguide/shellguide.html).
- Shell scripts based on [ShellCheck](https://github.com/koalaman/shellcheck) syntax guidelines.

## [v0.1.0] - 2021-01-09
### Added
- Docker Compose YAML file.
- Default `sonar-project.properties`.
- SonarQube shell script provides convenient CLI commands.
