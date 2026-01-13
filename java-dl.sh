#!/bin/bash

echo "platform: $PLATFORM"
echo "arch: $ARCH"

case $ARCH in
    aarch64)
        wget https://packages.microsoft.co -O packages-microsoft-prod.deb
        dpkg -i packages-microsoft-prod.deb
        apt-get update
        apt-get install -y msopenjdk-21
        ;;
    armv7)
        apt-get install -y default-jre #java 17
        ;;
    armhf)
        apt-get install -y default-jre #java 17
        ;;
    amd64)
        wget https://packages.microsoft.com -O packages-microsoft-prod.deb
        dpkg -i packages-microsoft-prod.deb
        apt-get update
        apt-get install -y msopenjdk-21
        ;;
    i386)
        apt-get install -y default-jre #java 17
        ;;
    *)
        echo "Unsupported architecture: $ARCH"
        exit 1
        ;;
esac


echo "Java version:"
java --version
