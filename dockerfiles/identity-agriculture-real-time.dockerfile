FROM python:3.9.13-slim-buster

WORKDIR /identitiy-agriculture-real-time

RUN apt-get update

RUN apt-get install ffmpeg libsm6 libxext6  -y

COPY ./backend/identitiy-agriculture-real-time/requirements.txt .

RUN pip install --no-cache-dir -r /identitiy-agriculture-real-time/requirements.txt

COPY ./backend/identitiy-agriculture-real-time .

CMD [ "python", "main.py"]

EXPOSE 8080