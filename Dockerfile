ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base-debian:trixie-2026.06.1
FROM ${BUILD_FROM}
ARG PLATFORM
ARG ARCH

# renovate: deb=wget
ENV WGET_VERSION=1.25.0-2
# renovate: deb=curl
ENV CURL_VERSION=8.14.1-2+deb13u4
# renovate: deb=openjdk-25-jdk
ENV JDK_VERSION=25.0.3+9-2~deb13u1

RUN apt-get update && apt-get install --no-install-recommends -y \
    wget=${WGET_VERSION} \
    curl=${CURL_VERSION} \
    openjdk-25-jdk=${JDK_VERSION} && \
    apt-get autoremove && apt-get clean && rm -rf /var/lib/apt/lists/* && \
    java --version

# renovate: datasource=github-releases depName=mikefarah/yq
ENV YQ_VERSION="v4.53.3"
RUN [ "$ARCH" = "aarch64" ] && YQ_ARCH="arm64" || YQ_ARCH="$ARCH" \
    echo "ARCH = ${YQ_ARCH}" && \
    curl https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_${YQ_ARCH} -o /usr/local/bin/yq && \
    chmod +x /usr/local/bin/yq \
    yq --version


ARG BUILD_NAME
ARG BUILD_SLUG
ARG BUILD_DESCRIPTION
ARG BUILD_REPO_NAME
ARG BUILD_AUTHOR
ARG BUILD_LICENSE
ARG BUILD_VERSION
LABEL \
    maintainer="${BUILD_AUTHOR} (https://github.com/${BUILD_AUTHOR})" \
    org.opencontainers.image.title=${BUILD_NAME} \
    org.opencontainers.image.description="${BUILD_DESCRIPTION}" \
    org.opencontainers.image.vendor="Home Assistant Add-ons" \
    org.opencontainers.image.authors="${BUILD_AUTHOR} (https://github.com/${BUILD_AUTHOR})" \
    org.opencontainers.image.licenses="${BUILD_LICENSE}" \
    org.opencontainers.image.url="https://github.com/${BUILD_AUTHOR}/${BUILD_REPO_NAME}" \
    org.opencontainers.image.source="https://github.com/${BUILD_AUTHOR}/${BUILD_REPO_NAME}" \
    org.opencontainers.image.documentation="https://github.com/${BUILD_AUTHOR}/${BUILD_REPO_NAME}/blob/main/README.md" \
    org.opencontainers.image.version=${BUILD_VERSION} \
    Name=${BUILD_NAME} \
    Version=${BUILD_VERSION}
