FROM python:3.8-slim
MAINTAINER Mark Gituma <mark.gituma@gmail.com>

RUN apt-get update && apt-get install -y \
    libpq-dev \
    gcc \
    curl \
    wget \
    vim \
    procps && \
    rm -rf /var/lib/apt/lists/*

ENV PROJECT_ROOT /app
WORKDIR $PROJECT_ROOT

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Remove unnecessary dependencies
RUN apt-get autoremove -y gcc

COPY . .
CMD python manage.py runserver 0.0.0.0:8000
