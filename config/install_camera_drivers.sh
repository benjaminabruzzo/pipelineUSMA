mkdir -p ~/.ros/camera_info && cp ~/pipeline16044/camera_info/* ~/.ros/camera_info/

####### pointgrey camera driver
sudo apt-get install -y coriander ros-kinetic-pointgrey-camera-driver ros-kinetic-camera1394
rosdep install camera1394
# cd ~/ros/src && mkdir pointgrey_camera_driver && cd pointgrey_camera_driver
# git init && git remote add gh git@github.com:benjaminabruzzo/pointgrey_camera_driver.git
# git pull gh master && catkin_remake

####### 1394 camera driver
# sudo apt-get install -y  --force-yes

# sudo apt-get install -y  --force-yes