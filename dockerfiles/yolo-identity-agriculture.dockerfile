FROM python:3.9.13-slim-buster

WORKDIR /yolo-identity-agriculture

RUN apt-get update

RUN apt-get install ffmpeg libsm6 libxext6  -y

RUN pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cpu

COPY ./backend/yolo-identity-agriculture/requirements.txt .

RUN pip install --no-cache-dir -r /yolo-identity-agriculture/requirements.txt

COPY ./backend/yolo-identity-agriculture .

CMD [ "python", "main.py"]

EXPOSE 8080