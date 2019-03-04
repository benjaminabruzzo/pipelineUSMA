
cd ~/pipelineUSMA/config && bash install_ros_kinetic.sh && sudo reboot
# reboot
cd ~/pipelineUSMA/config && bash init_ros.sh && cd ~/pipelineUSMA
# restart terminal

####### pointgrey camera driver
# # Download flycap from pointgrey: https://www.ptgrey.com/support/downloads
cd ~/pipelineUSMA/config && bash setup_flycap.sh 

cd ~/pipelineUSMA/config && bash install_camera_drivers.sh
#   ### update /etc/default/grub
sudo gedit /etc/default/grub
#   # in etc/default/grub find and replace
#   GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
#   # with this:
#   GRUB_CMDLINE_LINUX_DEFAULT="quiet splash usbcore.usbfs_memory_mb=1024"
#   # then update grub with
sudo update-grub && sudo reboot # reboot required

####### Install ros packages
cd ~/pipelineUSMA/config && bash install_packages.sh

