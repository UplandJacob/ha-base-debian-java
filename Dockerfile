ARG BUILD_FROM
FROM ${BUILD_FROM}

RUN apt-get update && apt-get install --no-install-recommends -y openjdk-21-jdk curl yq
