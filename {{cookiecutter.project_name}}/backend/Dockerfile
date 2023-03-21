FROM python:3.10

RUN mkdir /database
ADD ./database /database

RUN mkdir /backend
ADD ./backend /backend

RUN python -m pip install /database/.
RUN python -m pip install /backend/.