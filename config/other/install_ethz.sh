rm -rf ~/ros/devel
rm -rf ~/ros/build
rm ~/ros/.catkin_workspace

# Requirements: 
# eigen3 : check using pkg-config --modversion eigen3
sudo apt-get install -y coinor-libipopt-dev clang-3.5 clang-tidy-3.9 clang-format-3.9
sudo apt-get install -y ros-kinetic-ifopt

cd ~/ros/ && git clone https://github.com/ethz-asl/kindr.git
mkdir -p ~/ros/kindr/build && cd ~/ros/kindr/build 
cmake ..
sudo make install

cd ~/ros/src/ && git clone https://bitbucket.org/adrlab/ct.git && cd ~/ros/
catkin build ct ct_core ct_doc ct_models ct_optcon ct_rbd -DCMAKE_BUILD_TYPE=RELEASE 

cp ~/pipelineUSMA/config/build_ct.sh ~/ros
