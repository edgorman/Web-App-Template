# Web App Template

A cookiecutter template for deploying a simple web app to the cloud.

## Table of Contents

- [Overview](#overview)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Overview

It has the following features:

1. Python backend with configurable version
2. Node frontend with configurable version
3. Docker images deployable via Helm charts
4. Google Cloud Platform infrastructure via Terraform
5. Automated testing and deployment via GitHub actions

## Usage

To use this cookiecutter template, clone the repo and then run the following:

```bash
python -m pip install cookiecutter
python -m cookiecutter . -o <parent-repository-folder>
```

And then to create the repository and upload it to GitHub:

```bash
cd <parent-repository-folder>
git init
git add .
git commit -m "Initial commit"
git remote add origin git@github.com:<your-username>/<repository-name>
git push -u origin main
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

[MIT](https://choosealicense.com/licenses/mit/)
