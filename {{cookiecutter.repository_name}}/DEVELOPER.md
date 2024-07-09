# Developer

This repository is a monorepo containing all services and infrastructure for this project. The services and cloud definitions are separated by subdirectories, but any shared classes or structs should be placed in a central directory.

## Local deployment

To deploy all services and infrastructure of this project locally, please follow the guide [here](infrastructure/local/README.md).

To deploy individual services or infrastrucure, please refer to each of the following guides:

1. [{{cookiecutter.backend_name}}](\{\{cookiecutter.backend_name\}\}/README.md)
2. [{{cookiecutter.frontend_name}}](\{\{cookiecutter.frontend_name\}\}/README.md)
3. [CICD](infrastructure/cicd/README.md)
4. [Cloud](infrastructure/cloud/README.md)
5. [Deployments](infrastructure/deployments/README.md)
6. [Database](infrastructure/database/README.md)
7. [Workflows](infrastructure/workflows/README.md)

## Cloud deployment

To deploy all services and infrastructure of this project to the cloud, please follow these steps:

1. Assuming you have just cloned this repo, create a production branch (if it isn't the default branch) and a develop branch.

```
git checkout -b {{cookiecutter.prod_branch}}
git push -u origin {{cookiecutter.prod_branch}}

git checkout -b {{cookiecutter.dev_branch}}
git push -u origin {{cookiecutter.dev_branch}}
```

2. Next, set up a GCP account:

TODO

3. You will need to set up two GCP projects, one for develop and another for production:

TODO

4. Each GCP project will require a service account to execute Terraform scripts:

TODO

5. Next you will need to set up a Terraform Cloud account to store the state file:

TODO

6. You will also need to set up two workspaces within an organisation, one for develop and another for production:

TODO

7. Next you will need to set up two environments in the GitHub repository:

`{{cookiecutter.dev_branch}}` for your develop environment
`{{cookiecutter.prod_branch}}` for your production environment

And for each environment, you will need to set up the following variables/secrets:

`GCP_PROJECT_ID` (secret, from https://console.cloud.google.com/)
`GCP_SERVICE_ACCOUNT_KEY` (secret, from https://console.cloud.google.com/)
`TF_TOKEN` (secret, from https://app.terraform.io/app)
`IMAGE_TAG` (variable, `{{cookiecutter.dev_image_tag}}` or `{{cookiecutter.prod_image_tag}}`)

8. Next you can make a pull request against the `{{cookiecutter.dev_branch}}` branch to trigger a release to the develop environment.

9. Finally you can make a pull request against the `{{cookiecutter.prod_branch}}` branch to trigger a release to the production environment.

10. Sit back and enjoy the website!
