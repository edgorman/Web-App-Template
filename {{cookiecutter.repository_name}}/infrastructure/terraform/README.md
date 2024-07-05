# Terraform

This subdirectory stores the Terraform configuration for this project's cloud deployment.

Generally you will not need to run Terraform directly, as all operations will be handled through CICD.

## Installation

To install Terraform, follow this guide:

https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

## Usage

To connect this directory to the remote Terraform state file, run the following:

```
TODO
```

To format the Terraform files, run the following:

```bash
terraform fmt .
```

To check a change that was made, run the following:

```bash
terraform plan
```

To apply the change that was made, run the following:

```bash
terraform apply
```

## Development

Please follow https://www.terraform-best-practices.com/ for a list of best practices when doing Terraform development.

Also please run the format and plan command locally before making a pull request to make sure your contribution passes the CI/CD.
