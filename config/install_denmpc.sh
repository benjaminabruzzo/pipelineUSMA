mkdir -p ~/ros/src/denmpc && cd ~/ros/src/denmpc 
git init && git remote add gh git@github.com:benjaminabruzzo/denmpc.git
git pull gh master
cd ~/ros

touch ~/ros/build_denmpc.bash
echo "cd ~/ros" >> ~/ros/build_denmpc.bash
echo "catkin build denmpc" >> ~/ros/build_denmpc.bash
echo "source ~/ros/devel/setup.sh" >> ~/ros/build_denmpc.bash
cd ~/ros && chmod +x build_denmpc.bash && bash build_denmpc.bash


