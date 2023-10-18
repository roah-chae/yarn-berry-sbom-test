FROM ubuntu:20.04

ENV app_dir_base goormService
ENV app_name yarn-test

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt install -y build-essential curl git libc6-i386-cross && \
    (curl -sL https://deb.nodesource.com/setup_16.x | bash -) && \
    apt-get install -y nodejs

WORKDIR /${app_dir_base}/${app_name}

# COPY ${app_name} /${app_dir_base}/${app_name}

RUN npm install yarn -g && \
    yarn set version stable && \
    yarn install --silent
	
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*
