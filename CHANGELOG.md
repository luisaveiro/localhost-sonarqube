# Changelog
All notable changes to `luisaveiro/localhost-sonarqube` will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

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
