ARG BUILD_FROM
FROM ${BUILD_FROM}
ARG PLATFORM
ARG ARCH

COPY java-dl.sh java-dl.sh
RUN chmod 777 ./java-dl.sh

RUN apt-get update && apt-get install --no-install-recommends -y wget curl yq default-jre

#RUN ./java-dl.sh

RUN rm ./java-dl.sh
