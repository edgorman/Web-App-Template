# {{cookiecutter.frontend_name}}

This subdirectory stores the code for the {{cookiecutter.frontend_name}} service.

## Installation

To install Node {{cookiecutter.frontend_node_version}}, follow this guide:

https://nodejs.org/en/download/package-manager

To install the node packages, run the following:

```bash
cd {{cookiecutter.frontend_name}}
npm install
```

## Usage

To run tests locally, run the following:

```bash
npm test
```

To run the Docker image locally, run the following:

```bash
docker build . -t {{cookiecutter.frontend_image_name}}:local
docker run {{cookiecutter.frontend_image_name}}:local
```

And to cleanup Docker afterwards, run the following:

```bash
docker image remove {{cookiecutter.frontend_image_name}}:local -f
```

## Development

Please follow https://peps.python.org/pep-0008/ for a list of best practices when doing Python development.
