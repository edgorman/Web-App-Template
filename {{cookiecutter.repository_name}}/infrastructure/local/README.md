# Local

This subdirectory stores the config necessary to deploy the project locally using Docker Compose.

## Installation

To install Docker Compose, follow this guide:

https://docs.docker.com/compose/install/

## Usage

To deploy the services locally, run the following:

```bash
docker-compose -f infrastructure/local/docker-compose.yaml up -d
```

To spin down the services locally, run the following:

```bash
docker-compose -f infrastructure/local/docker-compose.yaml down -v
```

To delete the local services fully, run the following:

```bash
docker-compose -f infrastructure/local/docker-compose.yaml down -v --remove-orphans --rmi all
```

## Development

The Docker Compose yaml is purely for development purposes and may not reflect how your contribution appears in the cloud deployment.

Please be careful when making changes and remember to update the equivalent section of code in the other infrastructure subdirectories.
