FROM python:3.11.3-slim-buster

WORKDIR /FASTAPI-AGRICULTURE-IDENTITY

RUN apt-get update

RUN apt-get install ffmpeg libsm6 libxext6  -y

COPY ./backend/FASTAPI-AGRICULTURE-IDENTITY/requirements.txt .

RUN pip install --no-cache-dir -r /FASTAPI-AGRICULTURE-IDENTITY/requirements.txt

COPY ./backend/FASTAPI-AGRICULTURE-IDENTITY .

CMD [ "python", "main.py"]

EXPOSE 8080