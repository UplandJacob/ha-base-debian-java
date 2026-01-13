#!/bin/bash

echo "platform: $PLATFORM"
echo "arch: $ARCH"



case $ARCH in
    aarch64)
        apt-get install --no-install-recommends -y openjdk-21-jdk
        ;;
    armv7)
        apt-get install --no-install-recommends -y default-jre #java 17
        ;;
    armhf)
        apt-get install --no-install-recommends -y default-jre #java 17
        ;;
    amd64)
        apt-get install --no-install-recommends -y openjdk-21-jdk
        ;;
    i386)
        apt-get install --no-install-recommends -y default-jre #java 17
        ;;
    *)
        echo "Unsupported architecture: $ARCH"
        exit 1
        ;;
esac


echo "Java version:"
java --version
