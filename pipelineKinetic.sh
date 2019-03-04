
cd ~/pipelineUSMA/config && bash install_ros_kinetic.sh && cd ~/pipelineUSMA/config && sudo reboot
# reboot
cd ~/pipelineUSMA/config && bash init_ros.sh && cd ~/pipelineUSMA/config
# restart terminal

####### pointgrey camera driver
# # Download flycap from pointgrey: https://www.ptgrey.com/support/downloads
cd ~/pipelineUSMA/config && bash setup_flycap.sh

cd ~/pipelineUSMA/config && bash install_camera_drivers.sh && cd ~/pipelineUSMA/config
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
cd ~/pipelineUSMA/config && bash install_packages.sh && cd ~/pipelineUSMA

# install rclone seperately because it needs to be configured
cd ~/pipelineUSMA/config && bash install_rclone.sh && cd ~/pipelineUSMA


## Install MATLAB
cd ~/Downloads/matlab* && sudo sh install
cd ~/pipelineUSMA/config && bash config_matlab.sh && cd ~/pipelineUSMA/config

# # Gitlab
# cd ~/pipelineUSMA/config && sudo bash install_gitlab.sh && cd ~/pipelineUSMA/config
# sudo EXTERNAL_URL="venus" apt-get install -y gitlab-ee


