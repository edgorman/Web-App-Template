# Database

This subdirectory stores the Database config and migration scripts.

Generally you will not need to run Postgres/Flyway directly, as all database operations will be handled through CI/CD.

## Installation

To install Postgres, use an installer from this website:

https://www.postgresql.org/download/

To install Flyway, use an installer from this website:

https://documentation.red-gate.com/fd/command-line-184127404.html

## Usage

To access the local database via `psql` or a GUI like `TablePlus`, use the following credentials:

```bash
# Local:
db_name={{cookiecutter.database_name}}
host=127.0.0.1
port={{cookiecutter.local_database_port}}
username={{cookiecutter.local_database_username}}
password={{cookiecutter.local_database_password}}

# e.g. psql -d {{cookiecutter.database_name}} -h 127.0.0.1 -p {{cookiecutter.local_database_port}} -U {{cookiecutter.local_database_username}}
#      password={{cookiecutter.local_database_password}}
```

To validate a migration, run the following:

```bash
flyway validate -X -configFiles=infrastructure/database/config/flyway.toml -environment=local -ignoreMigrationPatterns='*:pending'
```

To run a migration, run the following:

```bash
flyway migrate -X -configFiles=infrastructure/database/config/flyway.toml -environment=local
```

To run these commands against the cloud deployments, update the environment configuration in file `infrastructure/database/config/flyway.toml` and then pass `dev` or `prod` in the environment parameter. 

## Development

Any structural changes made to tables or views in the database must be made using a migration. Any data changes should either be performed manually (via pair programming) or as a workflow executing the SQL operation.

To add a new migration, create a new folder with an incremented semver name, and format each SQL filename like the example already present. For more information see https://documentation.red-gate.com/fd/migrations-184127470.html

Unforunately undo migrations are [not supported in the community edition](https://www.red-gate.com/products/flyway/editions) so just don't mess up your migrations... /s (may change this to be liquibase in the future...)
