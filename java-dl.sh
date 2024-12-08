#!/bin/bash


case $PLATFORM in
    aarch64)
        URL="https://download.oracle.com/java/21/latest/jdk-21_linux-aarch64_bin.deb"
        ;;
    armv7)
        URL="https://download.oracle.com/java/21/latest/jdk-21_linux-armv7_bin.deb"
        ;;
    armhf)
        URL="https://download.oracle.com/java/21/latest/jdk-21_linux-armhf_bin.deb"
        ;;
    amd64)
        URL="https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.deb"
        ;;
    i386)
        URL="https://download.oracle.com/java/21/latest/jdk-21_linux-i386_bin.deb"
        ;;
    *)
        echo "Unsupported architecture: $ARCH"
        exit 1
        ;;
esac

wget -O -nv jdk-21.deb $URL

dpkg -i jdk-21.deb

echo "Java 21 version:"

java --version
