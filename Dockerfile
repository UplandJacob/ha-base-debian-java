ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base-debian:trixie-2026.06.1
FROM ${BUILD_FROM}
ARG PLATFORM
ARG ARCH

COPY java-dl.sh java-dl.sh
RUN chmod 777 ./java-dl.sh

# renovate: depName=wget
ENV WGET_VERSION=1.25.0-2
# renovate: depName=curl
ENV CURL_VERSION=8.14.1-2+deb13u4

RUN apt-get update && apt-get install --no-install-recommends -y \
    wget=${WGET_VERSION} \
    curl=${CURL_VERSION}

# renovate: datasource=github-releases depName=mikefarah/yq
ENV YQ_VERSION="v4.53.3"
RUN [ "$ARCH" = "aarch64" ] && YQ_ARCH="arm64" || YQ_ARCH="$ARCH" \
    echo "ARCH = ${YQ_ARCH}" && \
    curl https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_${YQ_ARCH} -o /usr/local/bin/yq && \
    chmod +x /usr/local/bin/yq \
    yq --version

RUN ./java-dl.sh && \
    apt-get autoremove && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN rm ./java-dl.sh
