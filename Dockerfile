ARG BUILD_FROM
FROM ${BUILD_FROM}
ARG PLATFORM
ARG ARCH

COPY java-dl.sh java-dl.sh
RUN chmod 777 ./java-dl.sh

RUN apt-get update && apt-get install --no-install-recommends -y \
    wget \
    curl

# renovate: datasource=github-releases depName=mikefarah/yq
ENV YQ_VERSION="v4.50.1"
RUN [ "$ARCH" = "aarch64" ] && YQ_ARCH="arm64" || YQ_ARCH="$ARCH" \
    echo "ARCH = ${YQ_ARCH}" && \
    curl https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_${YQ_ARCH} -o /usr/local/bin/yq && \
    chmod +x /usr/local/bin/yq \
    yq --version

RUN ./java-dl.sh

RUN rm ./java-dl.sh
