FROM python:3.10

RUN mkdir /usr/database
ADD ./database /usr/database

RUN mkdir /usr/backend
ADD ./backend /usr/backend

RUN python -m pip install /usr/database/.
RUN python -m pip install /usr/backend/.