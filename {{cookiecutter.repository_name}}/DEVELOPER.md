# Developer

## Setup

...

## Backend

...

## Frontend

...

## Infrastructure

...

### Cloud deployment

...

### Local deployment

To deploy the services locally, run the following:

```bash
docker-compose -f infrastructure/local/docker-compose.yaml up -d
```

To delete the local services, run the following:

```bash
docker-compose -f infrastructure/local/docker-compose.yaml down -v --remove-orphans --rmi all
```
