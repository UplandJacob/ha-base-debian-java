#!/bin/bash

echo "platform: $PLATFORM"
echo "arch: $ARCH"

case $ARCG in
    aarch64)
        URL="https://download.oracle.com/java/21/latest/jdk-21_linux-aarch64_bin.tar.gz"
        wget -q -O jdk-21.tar.gz $URL
        tar -xzf jdk-21.tar.gz
        ;;
    armv7)
        URL="https://download.oracle.com/java/21/latest/jdk-21_linux-aarch64_bin.tar.gz"
        wget -q -O jdk-21.tar.gz $URL
        tar -xzf jdk-21.tar.gz
        ;;
    armhf)
        URL="https://download.oracle.com/java/21/latest/jdk-21_linux-aarch64_bin.tar.gz"
        wget -q -O jdk-21.tar.gz $URL
        tar -xzf jdk-21.tar.gz
        ;;
    amd64)
        URL="https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.deb"
        wget -q -O jdk-21.deb $URL
        dpkg -i jdk-21.deb
        ;;
    i386)
        URL="https://download.oracle.com/java/21/latest/jdk-21_linux-i386_bin.deb"
        ;;
    *)
        echo "Unsupported architecture: $ARCH"
        exit 1
        ;;
esac

#wget -q -O jdk-21.deb $URL

#dpkg -i jdk-21.deb

echo "Java version:"

java --version
