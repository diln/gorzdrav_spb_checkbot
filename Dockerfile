FROM python:3.11-slim

ENV TZ=Europe/Moscow

WORKDIR /opt/gorzdrav_spb_checkbot

COPY requirements.txt README.md config.py app.py ./
COPY modules ./modules

RUN pip install --no-cache-dir -r requirements.txt

ENTRYPOINT ["python3", "app.py"]