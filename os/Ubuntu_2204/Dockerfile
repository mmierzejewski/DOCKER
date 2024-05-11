FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -yqq update && apt-get -yqq upgrade && \
        apt-get install -yqq \
        build-essential \
        bash \
        git \
        tmux \
        curl \
        nano \
        dnsutils \
        wget \
        gcc && \

# Cleaning
    rm -rf /var/lib/apt/lists/* \

# Intel proxy
# ENV http_proxy=http://proxy-dmz.intel.com:911
# ENV https_proxy=http://proxy-dmz.intel.com:912
# ENV no_proxy=.intel.com,127.0.0.1,localhos
