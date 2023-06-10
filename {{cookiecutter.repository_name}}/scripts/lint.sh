#!/bin/bash

python -m autopep8 . --in-place --aggressive --recursive --max-line-length 120
python -m flake8 . --max-line-length=120 --exclude=.env
