FROM alpine:3

# Needed for better experience in container terminal
ENV TERM=xterm-256color

# Update and install
RUN apk update
RUN apk add \
      bash \
      git wget \
      gcc libc-dev \
      python3-dev py3-pip \
      py3-greenlet py3-pillow \
      py3-cffi py3-cryptography

# Set the encoding to avoid issues with internationalization packages.
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN pip3 install --upgrade pip setuptools wheel

# Add the project requirements
ADD website/requirements /opt/requirements

# Install the requirements, remove 3 for wagtail
RUN /bin/bash -c 'cd /opt \
      && pip3 install -r requirements/dev.txt'

# Set the needed variables
ENV PYTHONPATH=/app/website/wagtail_vue:/app/website/wagtail_vue/apps
ENV DJANGO_SETTINGS_MODULE=wagtail_vue.settings.dev

# change to /app for the working directory, you should mount the local dir volume here
WORKDIR /app

EXPOSE 8000

# Add bash aliases
ADD bash_aliases /root/.bash_aliases
