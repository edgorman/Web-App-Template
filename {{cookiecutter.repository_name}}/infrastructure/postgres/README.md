# Postgres

This subdirectory stores the Postgres and Flyway config/migration scripts.

Generally you will not need to run Postgres/Flyway directly, as all database operations will be handled through CI/CD.

## Installation

To install Postgres, use an installer from this website:

https://www.postgresql.org/download/

To install Flyway, use an installer from this website:

https://documentation.red-gate.com/fd/command-line-184127404.html

## Usage

To access the local database via `psql` or a GUI like `TablePlus`, use the following credentials:

```bash
host=127.0.0.1
port={{cookiecutter.local_database_port}}
username={{cookiecutter.local_database_username}}
password={{cookiecutter.local_database_password}}

# e.g. psql -h 127.0.0.1 -p {{cookiecutter.local_database_port}} -U {{cookiecutter.local_database_username}}
```

To validate a migration, run the following:

```bash
flyway validate -configFiles=infrastructure/postgres/config/flyway.local.toml
```

To run a migration, run the following:

```bash
flyway migrate -configFiles=infrastructure/postgres/config/flyway.local.toml
```

To run these commands against the cloud deployments, update the dev and prod configuration files in `infrastructure/postgres/config/` and then use the commands as shown above.

## Development

Any structural changes made to the database must be made using a migration. See this link for more information https://documentation.red-gate.com/fd/migrations-184127470.html

To add a new migration, create a new folder with an incremented semver name, and include two files per operation:

1. a SQL file that does the operation (starting with the letter `V`)
2. a SQL file that undoes the operation (starting with the letter `U`)
