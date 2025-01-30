FROM ubuntu:24.04
# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive \
    PYTHON_VERSION=3.10.16 \
    # Intel proxy
    http_proxy=http://proxy-dmz.intel.com:912 \
    https_proxy=http://proxy-dmz.intel.com:912 \
    no_proxy=.intel.com,127.0.0.1,localhost
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
    gcc \
    libkrb5-dev \
    htop \
    net-tools \
    wget \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    libffi-dev \
    liblzma-dev && \
    rm -rf /var/lib/apt/lists/* && \
    # Download and install Python
    wget https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz && \
    tar -xvf Python-${PYTHON_VERSION}.tgz && \
    cd Python-${PYTHON_VERSION} && \
    ./configure --enable-optimizations && \
    make -j$(nproc) && \
    make altinstall && \
    ln -sf /usr/local/bin/python3.10 /usr/local/bin/python3 && \
    rm -rf /Python-${PYTHON_VERSION} && \
    rm -f /Python-${PYTHON_VERSION}.tgz
