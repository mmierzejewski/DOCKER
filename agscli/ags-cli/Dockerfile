# Use the latest version of the base image
# FROM harbor.pact.intel.com/common/ags-cli:u2404p31015
FROM u2404p31016:latest

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive \
    USER_HOME_DIR=/work \
    APP_DIR=/app \
    EC_SITE=igk \
    CERT_FILE=/etc/ssl/certs/ca-certificates.crt

# Copy the application files to the app directory
COPY applications.productivity.ags-cli.cli ${APP_DIR}

# Copy the script with appropriate permissions
COPY --chmod=755 mmierzex.sh ${APP_DIR}

# Update and upgrade the system, then clean up
RUN apt-get -yqq update && \
    apt-get -yqq upgrade && \
    rm -rf /var/lib/apt/lists/* && \

    # Install the "login.swiss.intel.com" certificate
    curl -o /tmp/IntelSHA256RootCA.crt http://certificates.intel.com/repository/certificates/IntelSHA256RootCA-Base64.crt && \
    cat /tmp/IntelSHA256RootCA.crt >> ${CERT_FILE} && \

    # Modify the first line of ags.py to use python3
    sed -i '1c\#!/usr/bin/env python3' ${APP_DIR}/ags.py && \

    # Prepare the Python environment
    ln -sf /usr/local/bin/pip3.10 /usr/local/bin/pip && \
    cd ${APP_DIR} && \
    pip install --upgrade pip && \
    pip install -r requirements.txt && \

    # Set up aliases
    echo 'alias ags="python3 ${APP_DIR}/ags"' >> ~/.bashrc && \
    echo 'alias mmierzex="bash ${APP_DIR}/mmierzex.sh"' >> ~/.bashrc && \
    echo 'alias lsa="ls -al"' >> ~/.bashrc

# Set the working directory
WORKDIR ${USER_HOME_DIR}