FROM ubuntu:22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive \
    USER_HOME_DIR=/work \
    APP_DIR=/app \
    EC_SITE=igk \
# Intel proxy
    http_proxy=http://proxy-dmz.intel.com:911 \
    https_proxy=http://proxy-dmz.intel.com:912 \
    no_proxy=.intel.com,127.0.0.1,localhost

# Repo copy
COPY applications.productivity.ags-cli.cli ${APP_DIR}

# File to log in to AD and testing connection with certificate centrum: https://login.swiss.intel.com
COPY --chmod=755 mmierzex.sh ${APP_DIR}

# Kerberos and python components
RUN apt-get -yqq update && apt-get -yqq upgrade && \
        apt-get install -yqq \
        build-essential \
        bash \
        git \
        tmux \
        curl \
        nano \
        dnsutils \
        krb5-user \
        libpam-krb5 \
        python3-kerberos \
        gcc \
        libkrb5-dev \
        net-tools \
        wget \
        python3-pip && \
    rm -rf /var/lib/apt/lists/* && \
# Installing "login.swiss.intel.com" certificate
    curl http://certificates.intel.com/repository/certificates/IntelSHA256RootCA-Base64.crt  > /tmp/IntelSHA256RootCA.crt && \
    cat /tmp/IntelSHA256RootCA.crt >> /etc/ssl/certs/ca-certificates.crt && \
# Changing first line of ags.py file based on: https://github.com/intel-innersource/applications.productivity.ags-cli.cli#installation-on-linux
    sed -i '1c\#!/usr/bin/env python3' ${APP_DIR}/ags.py && \
# Python environment preparing
    cd ${APP_DIR} && \
    pip install --upgrade pip && \
    pip install -r /app/requirements.txt && \
    # pip install -U pyinstaller && \
# Alias
    echo 'alias ags="python3 ${APP_DIR}/ags"' >> ~/.bashrc && \
    echo 'alias test="bash ${APP_DIR}/test.sh"' >> ~/.bashrc && \
    echo 'alias lsa="la -al"' >> ~/.bashrc

# Work directory
WORKDIR ${USER_HOME_DIR}
