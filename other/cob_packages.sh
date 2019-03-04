echo "pipeline16044" && cd ~/pipeline16044/ && . commit.sh bb 'cob push'
cd ~/darknet/ && . commit gh 'cob push'
cd ~/ros/src/darknet_ros && . commit.sh gh 'cob push'
cd ~/ros/src/aruco_ros && . commit.sh gh 'cob push'
cd ~/ros/src/dso && . commit.sh gh 'cob push'
cd ~/ros/src/dso_ros && . commit.sh gh 'cob push'
cd ~/ros/src/denmpc && . commit.sh gh 'cob push'
cd ~/ros/src/usma_ardrone && . commit.sh gh 'cob push'
cd ~/ros/src/usma_optitrack && git add --all . && git commit -m 'cob push' && git push gh master
cd ~/ros/src/metahast && . commit.sh bb 'cob push'
cd ~/ros
