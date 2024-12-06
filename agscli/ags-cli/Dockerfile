FROM harbor.pact.intel.com/common/ags-cli:u2204p310
ENV DEBIAN_FRONTEND=noninteractive \
    USER_HOME_DIR=/work \
    APP_DIR=/app \
    EC_SITE=igk \
    CERT_FILE=/etc/ssl/certs/ca-certificates.crt
# Repo copy
COPY applications.productivity.ags-cli.cli ${APP_DIR}
# File to log in to AD and testing connection with certificate centrum: https://login.swiss.intel.com
COPY --chmod=755 mmierzex.sh ${APP_DIR}
# Kerberos and python components
RUN apt-get -yqq update && apt-get -yqq upgrade && \
    rm -rf /var/lib/apt/lists/* && \
# Installing "login.swiss.intel.com" certificate
    curl http://certificates.intel.com/repository/certificates/IntelSHA256RootCA-Base64.crt  > /tmp/IntelSHA256RootCA.crt && \
    cat /tmp/IntelSHA256RootCA.crt >> /etc/ssl/certs/ca-certificates.crt && \
# changing first line of ags.py file based on: https://github.com/intel-innersource/applications.productivity.ags-cli.cli#installation-on-linux
    sed -i '1c\#!/usr/bin/env python3' ${APP_DIR}/ags.py && \
# python environment preparing
    ln -sf /usr/local/bin/pip3.10 /usr/local/bin/pip && \
    cd ${APP_DIR} && \
    pip install --upgrade pip && \
    pip install -r requirements.txt && \
# Alias
    echo 'alias ags="python3 ${APP_DIR}/ags"' >> ~/.bashrc && \
    echo 'alias mmierzex="bash ${APP_DIR}/mmierzex.sh"' >> ~/.bashrc && \
    echo 'alias lsa="la -al"' >> ~/.bashrc
# Work directory
WORKDIR ${USER_HOME_DIR}
