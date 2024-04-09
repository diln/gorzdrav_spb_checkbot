FROM docker.nexign.com/python:3.11-slim

# Mirror for PYPI Simple repo
ARG REPO_PYPI_SIMPLE="https://artifactory.nexign.com/artifactory/api/pypi/pypi/simple"

ENV TZ=Europe/Moscow

WORKDIR /opt/gorzdrav_spb_checkbot

COPY requirements.txt README.md config.py app.py ./
COPY modules ./modules

RUN pip install --index-url ${REPO_PYPI_SIMPLE} --no-cache-dir -r requirements.txt

ENTRYPOINT ["python3", "app.py"]