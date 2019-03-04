mkdir -p ~/ros/src/multimaster_fkie && cd ~/ros/src/multimaster_fkie
git init && git remote add gh git@github.com:fkie/multimaster_fkie.git && git pull gh master
cd ~/ros && catkin build multimaster_fkie
source ~/ros/devel/setup.bash


# sudo apt-get install ros-kinetic-multimaster-fkie