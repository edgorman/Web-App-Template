# Developer

## Table of Contents

* [Installation](#installation)
    * [Pre-requisites](#pre-requisites)
    * [Repository](#repository)
* [Usage](#usage)
    * [Create](#create)
    * [Destroy](#destroy)
    * [Test](#test)

---

## Installation

### Pre-requisites

Please install the following:

1. [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
2. [Python](https://www.python.org/downloads/)
3. [Docker](https://www.docker.com/)
4. [Docker Desktop](https://www.docker.com/products/docker-desktop/)

Install the [cookiecutter library](https://www.cookiecutter.io/) to your global Python environment:

```bash
python -m pip install cookiecutter
```

### Repository

Clone the repository:

```bash
git clone https://github.com/edgorman/Web-App-Template
cd Web-App-Template
```

## Usage

Before running the scripts, make sure [Docker Desktop](https://www.docker.com/products/docker-desktop/) is running and the files in the scripts folder have executable permissions:

```bash
chmod +x ./scripts/ -R
```

### Create

```bash
./scripts/create.sh
```

### Destroy

```bash
# Note: This destroys all containers and images spun up from create.sh
./scripts/destroy.sh
```

### Test

To run tests on the test project, run:

```bash
# Note: This will run create.sh for you, do not run before this
./scripts/test.sh
```
