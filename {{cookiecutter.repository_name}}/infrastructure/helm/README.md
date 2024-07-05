# Helm

This subdirectory stores the Helm configuration for services in this project.

Generally you will not need to run Helm directly, as all cloud infrastructure will be handled through Terraform.

## Installation

To install Helm, run the following:

```bash
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```

## Usage

To lint a Helm chart, run:

```bash
helm lint /path/tp/helm/chart
```

## Development

Please follow https://helm.sh/docs/chart_best_practices/ for a list of best practices when doing Helm development.

Also please run the lint command locally before making a pull request to make sure your contribution passes the CI/CD.
