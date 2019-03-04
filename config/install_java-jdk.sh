#!/bin/bash

# Configure your operating system to use the OpenJDK 8.
# Procedure

# In a terminal:

#     Install the OpenJDK 8 from a PPA repository:

    sudo add-apt-repository ppa:openjdk-r/ppa

    # Update the system package cache and install:

    sudo apt-get update && sudo apt-get install -y openjdk-8-jdk

    # If you have more than one Java version installed on your system use the following command to switch versions:

    sudo update-alternatives --config java

    # Make sure your system is using the correct JDK:

    java -version

    # openjdk version "1.8.0_72-internal"
    # OpenJDK Runtime Environment (build 1.8.0_72-internal-b05)
    # OpenJDK 64-Bit Server VM (build 25.72-b05, mixed mode)


# Suggested packages:
#   default-jre openjdk-8-demo openjdk-8-source visualvm icedtea-8-plugin fonts-wqy-microhei fonts-wqy-zenhei
#   fonts-indic


# !!!! Check version and path if launcher doesn't work

# Eclipse Shortcut
touch ~/.local/share/applications/eclipse.desktop
echo '#!/usr/bin/env xdg-open' >> ~/.local/share/applications/eclipse.desktop
echo '[Desktop Entry]' >> ~/.local/share/applications/eclipse.desktop
echo 'Type=Application' >> ~/.local/share/applications/eclipse.desktop
echo 'Icon=/home/benjamin/eclipse/cpp-2018-09/eclipse/icon.xpm' >> ~/.local/share/applications/eclipse.desktop
echo 'Name=Eclipse' >> ~/.local/share/applications/eclipse.desktop
echo 'Comment=Eclipse Integrated Development Environment' >> ~/.local/share/applications/eclipse.desktop
echo 'Exec=/home/benjamin/eclipse/cpp-2018-09/eclipse/eclipse' >> ~/.local/share/applications/eclipse.desktop
echo 'Terminal=false' >> ~/.local/share/applications/eclipse.desktop
echo 'Categories=Development;IDE;Java;' >> ~/.local/share/applications/eclipse.desktop
echo 'StartupWMClass=Eclipse' >> ~/.local/share/applications/eclipse.desktop

chmod u+x ~/.local/share/applications/eclipse.desktop

