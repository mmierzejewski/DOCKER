FROM ubuntu:24.04
# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive \
    USER_HOME_DIR=/work \
    APP_DIR=/app \
    EC_SITE=igk \
    PYTHON_VERSION=3.10.15 \
    CERT_FILE=/etc/ssl/certs/ca-certificates.crt \
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
# Installing "login.swiss.intel.com" certificate
    curl http://certificates.intel.com/repository/certificates/IntelSHA256RootCA-Base64.crt  > /tmp/IntelSHA256RootCA.crt && \
    cat /tmp/IntelSHA256RootCA.crt >> /etc/ssl/certs/ca-certificates.crt && \
# Download and install Python
    wget https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz && \
    tar -xvf Python-${PYTHON_VERSION}.tgz && \
    cd Python-${PYTHON_VERSION} && \
    ./configure --enable-optimizations && \
    make -j$(nproc) && \
    make altinstall && \
    ln -sf /usr/local/bin/python3.10 /usr/local/bin/python3 && \
    rm -rf /Python-${PYTHON_VERSION} && \
    rm -f /Python-${PYTHON_VERSION}.tgz && \
# Alias
    echo 'alias ags="python3 ${APP_DIR}/ags"' >> ~/.bashrc && \
    echo 'alias mmierzex="bash ${APP_DIR}/mmierzex.sh"' >> ~/.bashrc && \
    echo 'alias lsa="la -al"' >> ~/.bashrc
# Work directory
WORKDIR ${USER_HOME_DIR}
