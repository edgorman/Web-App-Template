# {{cookiecutter.backend_name}}

This subdirectory stores the code for the {{cookiecutter.backend_name}} service.

## Installation

To install Python {{cookiecutter.backend_python_version}}, follow this guide:

https://www.python.org/downloads/

To set up your environment, run the following:

```bash
cd {{cookiecutter.backend_name}}
python{{cookiecutter.backend_python_version}} -m venv .venv
source .venv/bin/activate
python -m pip install -r requirements.txt
```

## Usage

To run tests locally, run the following:

```bash
python -m pytest tests -svv
```

To run the Docker image locally, run the following:

```bash
docker build . -t {{cookiecutter.backend_image_name}}:local
docker run {{cookiecutter.backend_image_name}}:local
```

And to cleanup Docker afterwards, run the following:

```bash
docker image remove {{cookiecutter.backend_image_name}}:local -f
```

## Development

Please follow https://peps.python.org/pep-0008/ for a list of best practices when doing Python development.
