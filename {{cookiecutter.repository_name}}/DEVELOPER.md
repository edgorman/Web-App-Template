# Developer

## Table of Contents

* [Installation](#installation)
    * [Pre-requisites](#pre-requisites)
    * [Repository](#repository)
* [Deployment](#deployment)
    * [Local](#local)
    * [Cloud](#cloud)
* [Linting](#linting)
* [Testing](#testing)

---

## Installation

### Pre-requisites

Please install the following:

1. [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
2. [Python](https://www.python.org/downloads/)
3. [Docker](https://www.docker.com/)
4. [Docker Desktop](https://www.docker.com/products/docker-desktop/)

### Repository

Clone the repository:

```bash
git clone https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.repository_name }}
cd {{ cookiecutter.repository_name }}
```

## Deployment

### Local

To create the docker containers and volumes, run:

```bash
./scripts/create.sh
```

To start the project, run:

```bash
./scripts/start.sh
```

To stop the project, run:

```bash
./scripts/stop.sh
```

To destroy the docker containers and volumes, run:

```bash
./scripts/destroy.sh
```

### Cloud

`TODO`

## Linting

To run linting on the project, run:

```bash
./scripts/lint.sh
```

## Testing

To run testing on the project, run:

```bash
./scripts/test.sh
```
