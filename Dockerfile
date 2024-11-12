ARG BUILD_FROM
FROM ${BUILD_FROM}

RUN apt-get update && apt-get install --no-install-recommends -y default-jre curl yq
