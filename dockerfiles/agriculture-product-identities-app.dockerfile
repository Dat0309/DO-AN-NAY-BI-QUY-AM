FROM python:3.9.13-slim-buster

WORKDIR /agricultural-product-identification-app

RUN apt-get update

RUN apt-get install ffmpeg libsm6 libxext6  -y

COPY ./backend/agricultural-product-identification-app/requirements.txt .

RUN pip install --no-cache-dir -r /agricultural-product-identification-app/requirements.txt

COPY ./backend/agricultural-product-identification-app .

CMD [ "python", "main.py" ]

EXPOSE 8080