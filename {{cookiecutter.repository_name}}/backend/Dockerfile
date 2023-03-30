FROM python:3.10

RUN mkdir /{{cookiecutter.module_name}}
ADD ./{{cookiecutter.module_name}} /{{cookiecutter.module_name}}

RUN mkdir /database
ADD ./backend/database /database

RUN mkdir /worker
ADD ./backend/worker /worker

RUN mkdir /api
ADD ./backend/api /api

RUN python -m pip install /{{cookiecutter.module_name}}/.
RUN python -m pip install /database/.
RUN python -m pip install /worker/.
RUN python -m pip install /api/.
