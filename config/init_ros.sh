#!/bin/bash
cd ~/ros/src && catkin_init_workspace
cd ~/ros/ && catkin_make
source ~/ros/devel/setup.bash
sudo cp ~/pipelineUSMA/settings/catkin_remake /usr/bin/
cd /usr/bin && sudo chmod 655 catkin_remake 


