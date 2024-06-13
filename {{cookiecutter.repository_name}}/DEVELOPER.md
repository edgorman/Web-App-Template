# Developer

This repository is a monorepo containing all services and infrastructure for this project. The services and cloud definitions are separated by subfolders, but any shared classes or structs should be placed in a central directory.

## Setup

### {{cookiecutter.backend_name}}

The {{cookiecutter.backend_name}} uses Python {{cookiecutter.backend_python_version}}, so make sure this is installed. 

To set up your environment, run:

```bash
cd {{cookiecutter.backend_name}}
python{{cookiecutter.backend_python_version}} -m venv .venv
source .venv/bin/activate
python -m pip install -r requirements.txt
```

To run tests locally:

```bash
python -m pytest tests -svv
```

To run the Docker image locally:

```bash
docker build . -t {{cookiecutter.backend_image_name}}:local
docker run {{cookiecutter.backend_image_name}}:local
```

And to cleanup Docker afterwards:

```bash
docker image remove {{cookiecutter.backend_image_name}}:local -f
```

### Frontend

The {{cookiecutter.frontend_name}} uses Python {{cookiecutter.frontend_node_version}}, so make sure this is installed. 

To set up your environment, run:

```bash
cd {{cookiecutter.frontend_name}}
npm install
```

To run tests locally:

```bash
npm test
```

To run the Docker image locally:

```bash
docker build . -t {{cookiecutter.frontend_image_name}}:local
docker run {{cookiecutter.frontend_image_name}}:local
```

And to cleanup Docker afterwards:

```bash
docker image remove {{cookiecutter.frontend_image_name}}:local -f
```

### Infrastructure

Deployment is performed using Terraform and Helm charts. If you wish to run this locally, you must install the following:

TODO: list of packages needed

## Deployment

### Cloud

TODO: instruction for setting up gcp and terraform cloud

### Local

To deploy the services locally, run the following:

```bash
docker-compose -f infrastructure/local/docker-compose.yaml up -d
```

To delete the local services, run the following:

```bash
docker-compose -f infrastructure/local/docker-compose.yaml down -v --remove-orphans --rmi all
```
