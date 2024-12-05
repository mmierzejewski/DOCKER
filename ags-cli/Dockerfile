FROM ubuntu2404:latest
ENV DEBIAN_FRONTEND=noninteractive
# Repo copy
COPY applications.productivity.ags-cli.cli /app
# File to log in to AD and testing connection with certificate centrum: https://login.swiss.intel.com
COPY --chmod=755 mmierzex.sh ${APP_DIR}
# Kerberos and python components
RUN apt-get -yqq update && apt-get -yqq upgrade && \
    rm -rf /var/lib/apt/lists/* && \
# changing first line of ags.py file based on: https://github.com/intel-innersource/applications.productivity.ags-cli.cli#installation-on-linux
    sed -i '1c\#!/usr/bin/env python3' /app/ags.py && \
# python environment preparing
    ln -sf /usr/local/bin/pip3.10 /usr/local/bin/pip && \
    cd /app && \
    pip install --upgrade pip && \
    pip install -r requirements.txt
