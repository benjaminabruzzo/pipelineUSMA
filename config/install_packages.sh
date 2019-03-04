sudo apt-get update 
sudo apt-get install -y ros-kinetic-turtlebot ros-kinetic-turtlebot-apps ros-kinetic-vrpn-client-ros
sudo apt-get install -y ros-kinetic-turtlebot-interactions ros-kinetic-turtlebot-simulator 
sudo apt-get install -y ros-kinetic-multimaster-launch ros-kinetic-lms1xx hector-gazebo
sudo apt-get install -y ros-kinetic-navigation ros-kinetic-ardrone-autonomy ros-kinetic-hector-*
rosdep install ardrone_autonomy

cd ~/ros && rm -rf build && rm -rf devel
cd ~/pipelineUSMA/config && bash init_usma.sh && cd ~/pipelineUSMA
cd ~/pipelineUSMA/config && bash install_tex.sh && cd ~/pipelineUSMA
cd ~/pipelineUSMA/config && bash setup_redshift.sh && cd ~/pipelineUSMA
cd ~/pipelineUSMA/config && bash install_screenrecorder.sh && cd ~/pipelineUSMA
echo "!!! restart terminal !!!"
