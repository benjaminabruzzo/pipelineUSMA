sudo apt-get update 
sudo apt-get install -y ros-kinetic-turtlebot ros-kinetic-turtlebot-apps 
sudo apt-get install -y ros-kinetic-turtlebot-interactions ros-kinetic-turtlebot-simulator 
sudo apt-get install -y ros-kinetic-multimaster-launch ros-kinetic-lms1xx hector-gazebo
sudo apt-get install -y ros-kinetic-navigation ros-kinetic-ardrone-autonomy ros-kinetic-hector-*
rosdep install ardrone_autonomy



cd ~/pipeline16044/config && bash install_multimaster.sh && cd ~/pipeline16044
cd ~/pipeline16044/config && bash install_hast_space.sh && cd ~/pipeline16044
cd ~/pipeline16044/config && bash install_blender.sh && cd ~/pipeline16044
cd ~/pipeline16044/config && bash init_usma.sh && cd ~/pipeline16044
cd ~/pipeline16044/config && bash install_tex.sh && cd ~/pipeline16044
cd ~/pipeline16044/config && bash setup_redshift.sh && cd ~/pipeline16044
cd ~/pipeline16044/config && bash install_screenrecorder.sh && cd ~/pipeline16044
cd ~/pipeline16044/config && bash setup_dso.sh && cd ~/pipeline16044
cd ~/pipeline16044/config && bash install_denmpc.sh && cd ~/pipeline16044
echo "!!! restart terminal !!!"
