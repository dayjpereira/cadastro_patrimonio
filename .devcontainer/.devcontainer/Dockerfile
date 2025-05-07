FROM mcr.microsoft.com/devcontainers/base:ubuntu

RUN apt-get update && apt-get install -y \
  build-essential \
  libpq-dev \
  libsqlite3-dev \
  nodejs \
  yarn \
  curl \
  && rm -rf /var/lib/apt/lists/*
