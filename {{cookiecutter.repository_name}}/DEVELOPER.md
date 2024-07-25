# Developer

This repository is a monorepo containing all services and infrastructure for this project. The services and cloud definitions are separated by subdirectories, but any shared classes or structs should be placed in a central directory.

- [Services](services/README.md)
   - [{{cookiecutter.backend_name}}](\{\{cookiecutter.backend_name\}\}/README.md)
   - [{{cookiecutter.frontend_name}}](\{\{cookiecutter.frontend_name\}\}/README.md)

* [Infrastructure](infrastructure/README.md)
   - [CICD](infrastructure/cicd/README.md)
   - [Cloud](infrastructure/cloud/README.md)
   - [Database](infrastructure/database/README.md)
   - [Local](infrastructure/local/README.md)
   - [Services](infrastructure/services/README.md)
   - [Workflows](infrastructure/workflows/README.md)

## Local deployment

To deploy all services and infrastructure of this project locally, please follow the [local deployment guide](infrastructure/local/README.md).

To deploy individual services locally, see the README that is present within each subdirectory.

## Cloud deployment

To deploy all services and infrastructure of this project to the cloud, please refer to the guides in the [infrastructure](infrastructure/) subdirectory and follow these steps:

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

6. Within Terraform Cloud set up two workspaces within an organisation, one for develop and another for production:

TODO

7. This will produce key files which you should download and store somewhere locally. You can store them in this repository as the `.gitignore` will prevent these files from being uploaded to git.

`dev.terraform_cloud_key.txt`

`prod.terraform_cloud_key.txt`

8. Set up the Terraform CLI locally (follow [this README](infrastructure/cloud/README.md)) and perform an initial setup:

TODO

9. Initialise the develop infrastructure, inserting the necessary variables as inputs:

TODO

10. Once the infrastructure has been deployed, you can extract the argocd admin user credentials from a kubernetes secret:

```bash
gcloud container clusters get-credentials {{cookiecutter.repository_name}}-cluster --zone {{cookiecutter.gcp_region}} --project <dev-gcp-project>
kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 --decode
```

11. Open a PR to the `{{cookiecutter.dev_branch}}` branch and make changes to each of the services so new docker images get built and uploaded to the GCP artifact registries

12. Initialise the production infrastructure, inserting the necessary variables as inputs:

TODO

13. Once the infrastructure has been deployed, you can extract the argocd admin user credentials from a kubernetes secret:

```bash
gcloud container clusters get-credentials {{cookiecutter.repository_name}}-cluster --zone {{cookiecutter.gcp_region}} --project <dev-gcp-project>
kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 --decode
```

14. Open a PR to the `{{cookiecutter.prod_branch}}` branch and make changes to each of the services so new docker images get built and uploaded to the GCP artifact registries

15. Sit back and enjoy the web app! :)
