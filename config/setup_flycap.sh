#!/bin/bash

# download pipelineIndigo

cd /home/$USER/Downloads/flycapture2-2.12.3.2-amd64/
sudo apt-get install -y libraw1394-11 libgtk2.0-0 libgtkmm-2.4-dev libglademm-2.4-dev libgtkglextmm-x11-1.2-dev libusb-1.0-0
sudo sh install_flycapture.sh
mkdir -p ~/.ros/camera_info
cp ~/pipeline16044/camera_info/*.yaml ~/.ros/camera_info

sudo reboot