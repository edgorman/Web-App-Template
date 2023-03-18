FROM python:3.10

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN mkdir /database
ADD ./database /database

RUN mkdir /backend
ADD ./backend /backend

RUN python -m pip install /database/.
RUN python -m pip install /backend/.