# Developer

This repository is a monorepo containing all services and infrastructure for this project. The services and cloud definitions are separated by subfolders, but any shared classes or structs should be placed in a central directory.

## Table of Contents

- [Setup](#setup)
  - [{{cookiecutter.backend_name}}](#{{cookiecutter.backend_name}})
  - [{{cookiecutter.frontend_name}}](#{{cookiecutter.frontend_name}})
  - [Infrastructure](#infrastructure)
- [Deployment](#deployment)
  - [Local](#local)
  - [Cloud](#cloud)

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

### {{cookiecutter.frontend_name}}

The {{cookiecutter.frontend_name}} uses Node {{cookiecutter.frontend_node_version}}, so make sure this is installed. 

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

Deployment is performed using Terraform and Helm charts. The idea is that this is fully automated by CI/CD so no manual deployments are necessary.

Because there are no guarantees in life, you should install the following infrastructure tools:

1. TODO

## Deployment

### Local

To deploy the services locally, run the following:

```bash
docker-compose -f infrastructure/local/docker-compose.yaml up -d
```

If you need to add any Docker build arguments you can do so in the `docker-compose.yaml` file under each `services.<your-service>.build.args`

To delete the local services, run the following:

```bash
docker-compose -f infrastructure/local/docker-compose.yaml down -v --remove-orphans --rmi all
```

### Cloud

__Make sure this repository has separate production and develop branches before following these steps__

To deploy the services on the cloud, you will need to set up a GCP account:

1. TODO

You will need to set up two GCP projects, one for develop and another for production:

1. TODO

Each GCP project will require a service account to execute Terraform scripts:

1. TODO

Next you will need to set up a Terraform Cloud account to store the state file:

1. TODO

You will also need to set up two workspaces within an organisation, one for develop and another for production:

1. TODO

Next you will need to set up two environments in the GitHub repository:

1. `{{cookiecutter.dev_branch}}` for your develop environment
2. `{{cookiecutter.prod_branch}}` for your production environment

And for each environment, you will need to set up the following variables/secrets:

1. `GCP_PROJECT_ID` (secret, from https://console.cloud.google.com/)
2. `GCP_SERVICE_ACCOUNT_KEY` (secret, from https://console.cloud.google.com/)
3. `TF_TOKEN` (secret, from https://app.terraform.io/app)
4. `IMAGE_TAG` (variable, `{{cookiecutter.dev_image_tag}}` or `{{cookiecutter.prod_image_tag}}`)
