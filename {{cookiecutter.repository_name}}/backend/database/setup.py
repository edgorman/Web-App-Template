from setuptools import setup
from setuptools import find_packages

setup(
    name='database',
    version='0.0.1',
    author='{{ cookiecutter.author_name }}',
    author_email='{{ cookiecutter.author_email }}',
    packages=find_packages('.'),
    install_requires=[
        "pytest",
        "pydantic",
        "sqlmodel",
        "psycopg2-binary",
    ]
)
