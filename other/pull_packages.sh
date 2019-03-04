# cp ~/pipeline16044/config/pull_packages.sh ~/ros
cd ~/ros/src/usma_ardrone && git pull gh master && cd ~/ros
cd ~/ros/src/usma_optitrack && git pull gh master && cd ~/ros
cd ~/ros/src/metahast && git pull bb master && cd ~/ros
