
cd ~/pipeline16044/config && bash install_ros_kinetic.sh && cd ~/pipeline16044/config && sudo reboot
# reboot
cd ~/pipeline16044/config && bash init_ros.sh && cd ~/pipeline16044/config
# restart terminal

####### pointgrey camera driver
# # Download flycap from pointgrey: https://www.ptgrey.com/support/downloads
cd ~/pipeline16044/config && bash setup_flycap.sh

cd ~/pipeline16044/config && bash install_camera_drivers.sh && cd ~/pipeline16044/config
#   ### update /etc/default/grub
sudo gedit /etc/default/grub
#   # in etc/default/grub find and replace
#   GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
#   # with this:
#   GRUB_CMDLINE_LINUX_DEFAULT="quiet splash usbcore.usbfs_memory_mb=1024"
#   # then update grub with
sudo update-grub && sudo reboot # reboot required

####### Install ros packages
# After reboot:
# Download and extract blender.tar to downloads
# https://www.blender.org/download/
cd ~/pipeline16044/config && bash install_packages.sh && cd ~/pipeline16044

# install rclone seperately because it needs to be configured
cd ~/pipeline16044/config && bash install_rclone.sh && cd ~/pipeline16044


## Install MATLAB
cd ~/Downloads/matlab* && sudo sh install
cd ~/pipeline16044/config && bash config_matlab.sh && cd ~/pipeline16044/config

# # Gitlab
# cd ~/pipeline16044/config && sudo bash install_gitlab.sh && cd ~/pipeline16044/config
# sudo EXTERNAL_URL="venus" apt-get install -y gitlab-ee


