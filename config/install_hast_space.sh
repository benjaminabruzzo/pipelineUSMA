#!/bin/bash
# git clone git@bitbucket.org:benjaminabruzzo/apriltags_ros.git # last resort
mkdir -p ~/ros/src/apriltags_ros/apriltags_ros && cd ~/ros/src/apriltags_ros/apriltags_ros && git init && git remote add bb git@bitbucket.org:ags_robotics/apriltags_ros.git && git pull bb master
catkin_remake 


# http://wiki.ros.org/turtlebot/Tutorials/kinetic/Kobuki%20Base
. /opt/ros/kinetic/setup.bash 
rosrun kobuki_ftdi create_udev_rules


cd ~/ros/src && mkdir metahast && cd metahast && git init && git remote add bb git@bitbucket.org:ags_robotics/metahast.git && git pull bb master 
cd ~/ros && rm -rf build && rm -rf devel


touch ~/ros/build_hast.bash
echo ". /home/benjamin/ros/src/metahast/scripts/build_hast.bash" >> ~/ros/build_hast.bash
echo "source ~/ros/devel/setup.bash" >> ~/ros/build_hast.bash
cd ~/ros && chmod +x build_hast.bash && bash build_hast.bash


roscd metahast && cd ../hast/cam_info && cp *.yaml ~/.ros/camera_info && cd ~/pipeline16044


# catkin_remake && catkin_remake
# catkin_remake && catkin_remake


# cd ~/pipelineKinetic/config && bash install_viso2.sh && cd ~/pipelineKinetic/config

## Optional
# cd ~/pipelineKinetic/config && bash setup_lasers.sh && cd ~/pipelineKinetic/config
# cd ~/pipelineKinetic/config && bash kinect_setup.sh && cd ~/pipelineKinetic/config
