# Add id_rsa.pub to github

touch ~/ros/build_usma.bash
echo "cd ~/ros" >> ~/ros/build_usma.bash
echo "catkin build msg_to_tf optitrack_controller usma_ardrone usma_ardrone_gazebo usma_ardrone_gazebo_msgs usma_descriptions usma_plugins usma_mpc" >> ~/ros/build_usma.bash
echo "source ~/ros/devel/setup.sh" >> ~/ros/build_usma.bash
cd ~/ros && chmod +x build_usma.bash && bash build_usma.bash


#### usma_ardrone package
cd ~/ros/src && mkdir usma_ardrone && cd usma_ardrone
git init && git remote add gh git@github.com:westpoint-robotics/usma_ardrone.git && git pull gh master

#### usma_optitrack package
cd ~/ros/src && mkdir usma_optitrack && cd usma_optitrack
git init && git remote add gh git@github.com:westpoint-robotics/usma_optitrack.git && git pull gh master

#### face_shooter package
# cd ~/ros/src && mkdir face_shooter && cd face_shooter
# git init && git remote add gh git@github.com:westpoint-robotics/face_shooter.git && git pull gh master
# sudo apt-get install -y ros-kinetic-dynamixel-controllers ros-kinetic-usb-cam ros-kinetic-uvc-camera

cd ~/ros && . build_usma.bash