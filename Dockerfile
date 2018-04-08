FROM ubuntu:16.04

MAINTAINER togglecorp info@togglecorp.com

# Clean apt
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/lib/apt/lists/partial/* && \
    rm -rf /var/cache/apt/*

# Update and install common packages with apt
RUN apt-get update -y && \
    apt-get install -y \
        # Basic Packages
        git \
        locales \
        vim \
        curl \
        cron \
        unzip \
        libpq-dev \
        python \
        python-dev \
        python-setuptools \
        python-pip \
        libxml2-dev \
        libxslt1-dev \
        binutils \
        libproj-dev \
        gdal-bin \
        openjdk-8-jdk

# Support utf-8
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8

# Install node for react
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

RUN mkdir /code/kobocat -p && \
    mkdir /code/kpi -p
WORKDIR /code

RUN pip install virtualenv
RUN virtualenv /venv/kobocat && \
    virtualenv /venv/kpi

COPY ./kobocat/requirements /code/kobocat/requirements
COPY ./kobocat/requirements.txt /code/kobocat/requirements.txt
COPY ./kpi/requirements.txt /code/kpi/requirements.txt
COPY ./kpi/package.json /code/kpi/package.json

RUN . /venv/kobocat/bin/activate && \
    # Req for kobocat
    pip install -r /code/kobocat/requirements/base.pip && \
    pip install -r /code/kobocat/requirements.txt && \
    pip install -r /code/kobocat/requirements/dev.pip && \
    . /venv/kpi/bin/activate && \
    # Req for kpi
    pip install -r /code/kpi/requirements.txt

COPY . /code/

RUN cd /code/kpi && \
    npm install

run cd /code/enketo && \
    npm install
