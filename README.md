**A base Home Assistant addon docker image that is Debian with Java preinstalled (+yq and updating curl).**

This was made to make building my [Home Assistant addons](https://github.com/UplandJacob/Upland-HA-Addons/) faster.

**SOON:**
This container has Java 21 (Termurin) for amd64 and aarch64 architectures, but Oracle no longer releases newer versions of Java for 32-bit architectures, so armv7, armhf, and i386 are stuck with Java 17.
