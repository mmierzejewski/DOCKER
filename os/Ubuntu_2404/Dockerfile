FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -yqq update && apt-get -yqq upgrade && \
    apt-get -yqq install build-essential && \
    apt-get -yqq install bash git tmux curl nano dnsutils && \
    apt-get -yqq install wget gcc net-tools && \
    apt-get -yqq install python3

# Cleaning
RUN rm -rf /var/lib/apt/lists/*
