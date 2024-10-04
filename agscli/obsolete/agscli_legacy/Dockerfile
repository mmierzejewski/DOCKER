FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -yqq update && apt-get -yqq upgrade
RUN apt-get -yqq install build-essential
RUN apt-get -yqq install bash git tmux curl nano dnsutils
RUN apt-get -yqq install krb5-user libpam-krb5 && apt-get -yqq clean
RUN apt-get -yqq install python3-kerberos gcc
RUN apt-get -yqq install libkrb5-dev
RUN apt-get -yqq install wget
RUN apt-get -yqq install python3-pip

ENV http_proxy=http://proxy-dmz.intel.com:911
ENV https_proxy=http://proxy-dmz.intel.com:912
ENV no_proxy=.intel.com,127.0.0.1,localhos

RUN curl http://certificates.intel.com/repository/certificates/IntelSHA256RootCA-Base64.crt  > /tmp/IntelSHA256RootCA.crt
RUN cat /tmp/IntelSHA256RootCA.crt >> /etc/ssl/certs/ca-certificates.crt


# Repo cloning
COPY .netrc /root
RUN chmod 600 /root/.netrc
RUN git clone https://github.com/intel-innersource/applications.productivity.ags-cli.cli.git
RUN mv /applications.productivity.ags-cli.cli /app
RUN chmod 777 /app

# ags.py changing
RUN sed -i '1c\#!/usr/bin/env python3' /app/ags.py

# Virtualenv preparing
RUN mkdir /app/virtualenv
RUN cd /app
RUN apt-get -yqq install python3-venv
RUN python3 -m venv /app/virtualenv/ags-cli
COPY pip.sh /app
RUN chmod 755 /app/pip.sh

# Connection testing
COPY test.sh /app
RUN chmod 755 /app/test.sh

#Work catalogue
RUN mkdir /work
RUN chmod 755 -R /work

# Cleaning
RUN rm -rf /var/lib/apt/lists/*