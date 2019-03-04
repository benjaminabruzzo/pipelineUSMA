#install dependencies
sudo apt-get install -y libsuitesparse-dev libeigen3-dev libboost-all-dev libopencv-dev zlib1g-dev
sudo apt-get install -y libglew-dev ffmpeg libavcodec-dev libavutil-dev libavformat-dev libswscale-dev libavdevice-dev
sudo apt-get install -y libdc1394-22-dev libraw1394-dev libjpeg-dev libpng12-dev libtiff5-dev libopenexr-dev

#install libuvc
mkdir -p ~/ros/src/libuvc && cd ~/ros/src/libuvc && git init
git remote add gh git@github.com:ktossell/libuvc.git && git pull gh master
mkdir build && cd build && cmake ..
make && sudo make install

#install pangolin
mkdir -p ~/ros/src/pangolin && cd ~/ros/src/pangolin && git init
git remote add gh git@github.com:stevenlovegrove/Pangolin.git && git pull gh master
mkdir -p ~/ros/src/pangolin/build && cd ~/ros/src/pangolin/build && cmake ..
cmake --build .

#download dso and ziplib
mkdir -p ~/ros/src/dso && cd ~/ros/src/dso && git init
git remote add gh git@github.com:benjaminabruzzo/dso.git && git pull gh master

# install ziplib
cd ~/ros/src/dso/thirdparty && tar -zxvf libzip-1.1.1.tar.gz && cd libzip-1.1.1/ && ./configure
make && sudo make install
sudo cp lib/zipconf.h /usr/local/include/zipconf.h   # (no idea why that is needed).

#install dso
mkdir ~/ros/src/dso/build && cd ~/ros/src/dso/build && cmake .. && make -j
make -j

# install dso_ros
mkdir -p ~/ros/src/dso_ros && cd ~/ros/src/dso_ros && git init
git remote add gh git@github.com:benjaminabruzzo/dso_ros.git && git pull gh master
export DSO_PATH=~/ros/src/dso && echo 'export DSO_PATH=~/ros/src/dso' >> ~/.bashrc
touch ~/ros/build_dso_ros.bash && chmod +x ~/ros/build_dso_ros.bash
echo "cd ~/ros" >> ~/ros/build_dso_ros.bash
echo "catkin build dso_ros" >> ~/ros/build_dso_ros.bash
cd ~/ros && bash build_dso_ros.bash

# #install aruco_ros
mkdir -p ~/ros/src/aruco_ros && cd ~/ros/src/aruco_ros && git init
git remote add gh git@github.com:benjaminabruzzo/aruco_ros.git && git pull gh master
git fetch gh && git checkout kinetic-devel
echo "catkin build aruco_ros" >> ~/ros/build_dso_ros.bash
cd ~/ros && bash build_dso_ros.bash


#install calibration toolkit
mkdir -p ~/ros/src/mono_dataset_code && cd ~/ros/src/mono_dataset_code && git init
git remote add gh git@github.com:benjaminabruzzo/mono_dataset_code.git && git pull gh masterc
make . && make




