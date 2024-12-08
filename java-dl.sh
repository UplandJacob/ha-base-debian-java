#!/bin/bash

echo "platform: $PLATFORM"
echo "arch: $ARCH"

case $ARCH in
    aarch64)
        URL="https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.5%2B11/OpenJDK21U-jdk_aarch64_linux_hotspot_21.0.5_11.tar.gz"
        ;;
    armv7)
        URL=""
        apt-get install -y default-jre #java 17
        ;;
    armhf)
        URL=""
        apt-get install -y default-jre #java 17
        ;;
    amd64)
        URL="https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.5%2B11/OpenJDK21U-jdk_x64_linux_hotspot_21.0.5_11.tar.gz"
        ;;
    i386)
        apt-get install -y default-jre #java 17
        ;;
    *)
        echo "Unsupported architecture: $ARCH"
        exit 1
        ;;
esac
if [[ ! -z "$URL" ]]; then
    # Download and extract the package
    wget -q -O jdk-21.tar.gz $URL
    tar -xzf jdk-21.tar.gz -C /usr/local
    
    # Set JAVA_HOME and update PATH
    JAVA_HOME=$(find /usr/local -maxdepth 1 -type d -name "jdk-21*")
    echo "export JAVA_HOME=$JAVA_HOME" >> ~/.bashrc
    echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> ~/.bashrc
    
    # Apply changes to PATH
    source ~/.bashrc
fi

echo "Java version:"
java --version
