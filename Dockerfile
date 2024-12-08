ARG BUILD_FROM
FROM ${BUILD_FROM}

RUN apt-get update && apt-get install --no-install-recommends -y wget curl yq
RUN wget https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.deb && \
    apt-get install ./jdk-21_linux-x64_bin.deb
