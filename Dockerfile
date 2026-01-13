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
ENV YQ_VERSION="v4.50.0"
RUN ["$BUILD_ARCH" = "aarch64" ] && ARCH="arm64" || ARCH="$BUILD_ARCH" \
    echo "ARCH = ${ARCH}" && \
    curl https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_${ARCH} -o /usr/local/bin/yq && \
    chmod +x /usr/local/bin/yq

RUN ./java-dl.sh

RUN rm ./java-dl.sh
