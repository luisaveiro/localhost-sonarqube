<p align="center">
    <a href="http://github.com/luisaveiro/localhost-sonarqube">
        <img src="./images/code-review.svg" alt="Code Review" width="50%">
    </a>
</p>

<h4 align="center">
    Analysing source code locally with SonarQube in a Docker environment.
</h4>

<p align="center">
    <a href="#about">About</a> •
    <a href="#disclaimer">Disclaimer</a> •
    <a href="#getting-started">Getting Started</a> •
    <a href="#download">Download</a> •
    <a href="#how-to-use">How To Use</a> •
    <a href="#executing-commands">Executing Commands</a>
</p>
<p align="center">
    <a href="#useful-tips">Useful Tips</a> •
    <a href="#changelog">Changelog</a> •
    <a href="#contributing">Contributing</a> •
    <a href="#security-vulnerabilities">Security Vulnerabilities</a> •
    <a href="#credits">Credits</a> •
    <a href="#license">License</a>
</p>

## About

This repository offers a light-weight command-line interface for interacting with [SonarQube](https://www.sonarqube.org/) 
*Community Edition* and analyse your source code with SonarScanner (*CLI*) in a Docker environment. 

The `sonarqube` shell script provides convenient CLI commands for interacting with the Docker containers defined by the 
`docker-compose.yml` file. It also provides a method to copy SonarScanner configuration templates 
(`sonar-project.properties`) for easy setup.

[SonarQube](https://www.sonarqube.org/) is an open-source platform developed by SonarSource for continuous inspection 
of code quality to perform automatic reviews with static analysis of code to detect bugs, code smells, and security 
vulnerabilities on 20+ programming languages.

<p align="center">
    <a href="https://www.sonarqube.org">
        <img src="./images/sonarqube.png" alt="Code Review" width="100%">
    </a>
    <sub><sup>[Source: www.sonarqube.org]</sup></sub>
</p>

## Disclaimer

**Please note:** ***Localhost SonarQube*** is not affiliated with SonarSource SA and is not an official product. 
“SONARQUBE" is a trademark belonging to SonarSource SA.

***Localhost SonarQube*** has been developed to run SonarQube in a local Docker environment. To install a production 
instance, read the SonarQube [Requirements](https://docs.sonarqube.org/latest/requirements/requirements/), and then 
follow the [Installation Guide](https://docs.sonarqube.org/latest/setup/install-server/).

**Please note:** This readme assumes you are familiar with SonarQube and will not be covering on how to set up projects 
in SonarQube and configure `sonar-project.properties` files to analyse a project. Please visit 
[SonarQube Documentation](https://docs.sonarqube.org/latest/setup/get-started-2-minutes/) for additional instructions or 
[SonarSource Community forum](https://community.sonarsource.com/) for assistance.


## Getting Started

You will need to make sure your system meets the following prerequisites:

- Docker Engine >= 19.03.0

This repository utilizes [Docker](https://www.docker.com/) to run SonarQube and SonarScanner. So, before using the CLI 
commands, make sure you have Docker installed on your system.

## Download

You can clone the latest version of ***Localhost SonarQube repository*** for macOS, Linux and Windows (via WSL2).

```bash
# Clone this repository.
$ git clone git@github.com:luisaveiro/localhost-sonarqube.git --branch main --single-branch
```

## How To Use

By default, ***Localhost SonarQube*** commands are invoked using the `path/localhost-sonarqube/bin/sonarqube` script.

```bash
# Start SonarQube Docker containers.
$ bash ~/localhost-sonarqube/bin/sonarqube up
```

#### <ins>Configuring A Bash Alias</ins>

Instead of you repeatedly typing `bash path/localhost-sonarqube/bin/sonarqube` to execute ***Localhost SonarQube*** 
commands, you can configure a Bash alias in `~/.bashrc` or `~/.zshrc` that allows you to execute the commands more 
easily:

```bash
alias sonarqube='bash ~/localhost-sonarqube/bin/sonarqube'
```

Once the Bash alias has been configured, you may execute ***Localhost SonarQube*** commands by simply typing 
`sonarqube`. The remainder of this readme's examples will assume that you have configured this alias:

```bash
# Start SonarQube Docker containers.
$ sonarqube up
```

## Executing Commands

The `sonarqube` script provides convenient CLI commands for interacting with the Docker containers defined by the 
`docker-compose.yml` file and running SonarScanner Docker image to analyse your project source code. The following 
commands are available for you to interact with your SonarQube Docker environment.

| # 	| Commands              	| Description                                                  	|
|---	|-----------------------	|--------------------------------------------------------------	|
| 1 	| sonarqube help        	| List of all available commands.                              	|
| 2 	| sonarqube self-update 	| Update Localhost SonarQube to the latest version.            	|
| 3 	| sonarqube up          	| Start SonarQube Docker containers.                           	|
| 4 	| sonarqube down        	| Stop SonarQube Docker containers.                            	|
| 5 	| sonarqube dashboard   	| Open SonarQube dashboard in the browser.                     	|
| 6 	| sonarqube publish     	| Publish SonarScanner properties file to a project directory. 	|
| 7 	| sonarqube scan        	| Scan project source code with SonarScanner.                  	|

Below I have provided more information on each `sonarqube` CLI command.

#### <ins>List of all available commands</ins>

To view a list of all available commands, you may use the `help` command:

```bash
$ sonarqube help
```

#### <ins>Update Localhost SonarQube to the latest version</ins>

To ensure you have the latest version of ***Localhost SonarQube***, you can use the `self-update` command:

```bash
$ sonarqube self-update
```

#### <ins>Starting and Stopping SonarQube containers</ins>

To start all of the Docker containers defined in ***Localhost SonarQube*** `docker-compose.yml` file, you should 
execute the `up` command:

```bash
$ sonarqube up
```

The Docker containers will run in the background ("detached" mode). Once the SonarQube Docker containers have been 
started, you may access the SonarQube dashboard in your web browser at: http://localhost:9000.

To stop all of the SonarQube Docker containers you may use the `down` command:

```bash
$ sonarqube down
```

#### <ins>Accessing SonarQube Dashboard</ins>

Once the SonarQube containers are up and running, you may access SonarQube dashboard in your web browser at: 
http://localhost:9000 or use `dashboard` command to open SonarQube dashboard in your web browser.

```bash
$ sonarqube dashboard
```

Log in to SonarQube dashboard using System Administrator credentials:

- login: **admin**
- password: **admin**

SonarQube will request you **change your password** once you are logged in.

#### <ins>Publish SonarScanner Configuration Templates</ins>

Once the SonarQube Docker containers are up and running, you're ready to use SonarScanner and begin creating projects. 
To do that, you must configure SonarScanner `sonar-project.properties` that is most appropriate for your needs.

***Localhost SonarQube*** repository includes a default `sonar-project.properties`. You can use the `publish` command 
to copy the default `sonar-project.properties` to your project root directory.

```bash
$ sonarqube publish
```

The `publish` command also accepts a template name as an argument and copy the template `sonar-project.properties` to 
your project root directory. 

```bash
$ sonarqube publish default
```

Please visit [SonarScanner Analysis Parameters Documentation](https://docs.sonarqube.org/latest/analysis/analysis-parameters/) 
for additional instructions to configure project analysis settings.

For available SonarScanner configuration templates, view `/sonarscanner-templates` directory. If you want to contribute 
a SonarScanner configuration template, please see the [contributing section](#contributing).

#### <ins>Scan Project Source Code</ins>

Once you have configure SonarScanner `sonar-project.properties` for your project. You can run the `scan` command in 
your project root directory to analyse your project source code.

```bash
$ sonarqube scan
```

## Useful Tips

[SonarCloud](https://sonarcloud.io/) enhance your workflow with continuous code quality, SonarCloud automatically 
analyzes and decorates pull requests on GitHub, Bitbucket, Azure DevOps and GitLab on most programming languages. 
SonarCloud is free for open-source projects.

SonarSource offers a free IDE extension called [SonarLint](https://www.sonarlint.org/) which helps you to detect and 
fix code quality issues while you write your code. SonarLint is a support plugin for the following IDEs.

- [Eclipse](https://www.sonarlint.org/eclipse/)
- [IntelliJ IDEA](https://www.sonarlint.org/intellij/)
- [Visual Studio](https://www.sonarlint.org/visualstudio/)
- [VS Code](https://www.sonarlint.org/vscode/)

## Changelog

Please see [CHANGELOG](CHANGELOG.md) for more information what has changed recently.

## Contributing

I encourage you to contribute to ***Localhost SonarQube***! Contributions are what make the open source community such 
an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

Please check out the [contributing to Localhost SonarQube guide](.github/CONTRIBUTING.md) for guidelines about how to 
proceed.

## Security Vulnerabilities

Trying to report a possible security vulnerability in ***Localhost SonarQube***? Please check out our 
[security policy](.github/SECURITY.md) for guidelines about how to proceed.

## Credits

The illustration used in the project is from [unDraw (created by Katerina Limpitsouni)](https://undraw.co/). 
All product names, logos, brands, trademarks and registered trademarks are property of their respective owners.

This software uses the following open source packages:

- [ANSI Code Generator](https://github.com/fidian/ansi)

## License

The MIT License (MIT). Please see [License File](LICENSE) for more information.

---

<p align="center">
  <a href="http://github.com/luisaveiro" target="_blank">GitHub</a> •
  <a href="https://uk.linkedin.com/in/luisaveiro" target="_blank">LinkedIn</a> •
  <a href="https://twitter.com/luisdeaveiro" target="_blank">Twitter</a>
</p>
