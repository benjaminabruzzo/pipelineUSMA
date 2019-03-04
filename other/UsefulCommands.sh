c++ image cat:
cv::hconcat(mat1, mat2, dst)
cv::vconcat(mat1, mat2, dst)

rosrun rqt_graph rqt_graph

rosrun tf view_frames
rosrun tf tf_monitor
rosrun tf tf_echo /ardrone_base_link /ar_marker_1

rosrun tf tf_echo /create_base_link /hast/stereo_left

rosrun tf tf_echo /ardrone2/ardrone_base_bottomcam /april_marker_0
rosrun tf tf_echo /ardrone_base_link /april_marker_0

rosrun tf tf_echo
listener.lookupTransform(markerChannel, "ardrone2/ardrone_base_link", ros::Time(0), transform_markers);


DATE=20151204
RUN=014
. sendtomac

scp /home/$USER/ros/data/$DATE/$RUN/*.m benjamin@jupiter.local:/Users/benjamin/git/hast/data/$DATE/$RUN/


scp /home/benjamin/ros/data/20151002/013/stateRecorder_013.m benjamin@10.0.1.7:/Users/benjamin/git/hast/data/20151002/013
scp /home/benjamin/ros/data/20151002/013/stateRecorder_013.m benjamin@192.168.0.5:/Users/benjamin/git/hast/data/20151002/013

Making a m4a video from png files
ffmpeg -y -r 24 -i "lrCircle_%05d.png" output.m4v

ffmpeg -y -r 12 -i "image_%03d.png" output.m4v
ffmpeg -y -r 12 -i "lBlob_%03d.png" lBlob.avi
ffmpeg -y -r 12 -i "image_%03d.png" output.avi

-y overwrites output files without prompt
-r 12 sets the input frame rate (12 fps)


scp /home/benjamin/ros/data/20161123/024/offlineStereo_024.m benjamin@jupiter.local:/Users/benjamin/git/hast/data/20161123/024
scp /home/benjamin/ros/data/20161123/025/offlineStereo_025.m benjamin@jupiter.local:/Users/benjamin/git/hast/data/20161123/025
scp /home/benjamin/ros/data/20161123/026/offlineStereo_026.m benjamin@jupiter.local:/Users/benjamin/git/hast/data/20161123/026

# ##################
# removing all lines in a file start start with: #
# OSX
sed -i '' '/^#/d' filepath

sed -i '' '/^uavRecorder.cmd/d' test.m

uavRecorder.cmd
# Linux
sed -i '/^#/d' filepath





# ************ firefly registers ****************
Trigger_mode 0x830 : set as external trigger on gpio 0 : 82 00 00 00
Brightness : set to 100 : : 82 00 00 64
exposure: 25.0
shutter: 120
gain: 16

# ************ Ubuntu Info ****************
check ubuntu version
lsb_release -a
	turtlebot@r1:~$ lsb_release -a
	No LSB modules are available.
	Distributor ID:	Ubuntu
	Description:	Ubuntu 10.04.4 LTS
	Release:	10.04
	Codename:	lucid

turtlebot@r1:~$ file /sbin/init
/sbin/init: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.15, stripped


# ************ ROS Info ****************

### Contains Desktop Defualts
/usr/share/applications/defaults.list
### User Specified Preferences
~/.local/share/applications/mimeapps.list

### Running Rosbags
mkdir ~/bagfiles
cd ~/bagfiles
rosbag record -a

-a ### Record all topics

rosbag record -O subset /right/camera/image_raw /left/camera/image_raw

rosbag record -O dronecmds2 /hast/dronePos /hast/droneCmd /cmd_vel
rosbag record -O dronehover1 /left/camera/image_rect_color /right/camera/image_rect_color

rxplot /hast/dronePos/linear/x:y:z, /cmd_vel/linear/x:y:z

rxplot /hast/dronePos/linear/x:y, /cmd_vel/linear/x:y, /hast/dronePos/angular/z

The '-O subset' argument tells rosbag record to log to a file named subset.bag
The topics listed will be recorded to the subset.bag
Ctrl-C quits the rosbag record.


/right/camera/image_rect_color /hast/blobl

### converting rosbag data
## If the first time, needs:
roscd image_view
rosmake image_view --rosdep-install
sudo aptitude install mjpegtools


To export jpeg images from a bag file first you will need to create a launch
 file which will dump the data. This example uses /camera/image_raw as the
 topic for the desired image data. This can be replaced as needed.

<launch>
  <node pkg="rosbag" type="play" name="rosbag" args="play -d 2 $(find image_view)/test.bag"/>
  <node name="extract" pkg="image_view" type="extract_images" respawn="false" output="screen" cwd="ROS_HOME">
    <remap from="image" to="/camera/image_raw"/>
  </node>
</launch>

The launch file can be started by running
	roslaunch export.launch

This will dump the images name frame%04d.jpg into the folder ".ros" in your
home directory. When the process has completed it will display a message similar
to process has finished cleanly. at which point you should enter ctrl-C to
end the launched program.

The images files can be easily to moved to where ever is convenient.

cd ~
mkdir test
mv ~/.ros/frame*.jpg test/

rosrun dynamic_reconfigure reconfigure_gui

#####################################3
Stereo Calibration
Launch File
<!-- -*- mode: XML -*- -->
<launch>
  <!-- run both cameras in the stereo_example namespace -->
  <group ns="stereo" >
    <!-- left camera -->
    <node pkg="camera1394" type="camera1394_node" name="left_node" >
		<param name="guid" value="00b09d0100af04f7" />
		<remap from="camera" to="left" />
    </node>
    <!-- right camera -->
    <node pkg="camera1394" type="camera1394_node" name="right_node" >
   		<param name="guid" value="00b09d0100af0503" />
		<remap from="camera" to="right" />
    </node>
  </group>
</launch>

cut and paste between the lines:
--------------------------------
rosrun camera_calibration cameracalibrator.py --size 9x6 --square 0.024 right:=/stereo/right/image_raw left:=/stereo/left/image_raw right_camera:=/stereo/right left_camera:=/stereo/left --approximate=0.1
--------------------------------
rosrun camera_calibration cameracalibrator.py --size 9x6 --square 0.024 right:=/right/camera/image_raw left:=/left/camera/image_raw right_camera:=/right/camera left_camera:=/left/camera --approximate=0.01
--------------------------------

--square 0.108 is the size fo the squares in meters (the tutorial uses 108 mm boxes), my board is 15/16" squares (15/16" = 23.8125 mm ~ .024m)  NOTE: Checkerboard size refers to the number of internal corner, as described in the OpenCV documentation (i.e. the 8x6 checkerboard contains 9x7 squares)
--approximate=0.01 This allows 0.01s time difference between image pairs
--no-service-check : This suppresses the service check for the driver
Use these commands after roslaunch camera1394_stereo.launch



rosrun
camera_calibration
cameracalibrator.py
--size 8x6
--square 0.108
--approximate=0.01
right:=/stereo/right/image_raw
left:=/stereo/left/image_raw
right_camera:=/stereo/right
left_camera:=/stereo/left

############################################33
--------------------------------------------------------

Other useful camera commands
rosrun image_view image_view image:=/stereo/left/image_raw
rosrun image_view image_view image:=/right/camera/image_rect
rosrun image_view image_view image:=/left/camera/image_rect_color

#Storing data in rosbags
mkdir ~/bagfiles
cd ~/bagfiles

#record ALL topics
rosbag record -a

#record log file with name bag_rect and only some topics
rosbag record -O bag_rect /right/camera/image_raw /left/camera/image_raw /right/camera/image_rect /left/camera/image_rect

#display info about the bag
rosbag info bag_rect.bag



--------------------------------------------------------
Calibrate single camera
rosrun camera_calibration cameracalibrator.py --size 8x6 --square 0.024 image:=/stereo/right/image_raw camera:=/stereo/right

--------------------------------------------------------
rosrun camera1394 camera1394_node _guid:=00b09d0100af04f7

dyanmic camera configure
rosrun rqt_reconfigure rqt_reconfigure


############################################------------------####################-HAST EXPERIMENT-########################-----------------############################################
sudo service turtlebot stop
roscore
rosrun ardrone_autonomy ardrone_driver
rosservice call /ardrone/togglecam
rostopic echo /ardrone/navdata

<node pkg="odom_from_ar_marker" type="odom_from_ar_marker5" name="odom_marker_5" output="screen" />
<node pkg="odom_from_ar_marker" type="odom_from_ar_marker6" name="odom_marker_6" output="screen" />
<node pkg="odom_from_ar_marker" type="odom_from_ar_marker7" name="odom_marker_7" output="screen" />

rostopic pub -r 10 /hast/drone/DesiredPose geometry_msgs/Twist  '{linear:  {x: 96.0, y: 0.0, z: 36.0}, angular: {x: 0.0,y: 0.0,z: 10.0}}'
rostopic pub -r 10 /hast/drone/DesiredPose geometry_msgs/Twist  '{linear:  {x: 84.0, y: 10.0, z: 36.0}, angular: {x: 0.0,y: 0.0,z: 10.0}}'
rostopic pub -r 10 /hast/drone/DesiredPose geometry_msgs/Twist  '{linear:  {x: 84.0, y: -10.0, z: 36.0}, angular: {x: 0.0,y: 0.0,z: 10.0}}'


rostopic pub -r 10 /hast/drone/DesiredPose geometry_msgs/Twist  '{linear:  {x: 80.0, y: 0.0, z: 36.0}, angular: {x: 0.0,y: 0.0,z: 10.0}}'
rostopic pub -r 10 /hast/drone/DesiredPose geometry_msgs/Twist  '{linear:  {x: 60.0, y: 0.0, z: 36.0}, angular: {x: 0.0,y: 0.0,z: 10.0}}'

rostopic pub -r 10 /hast/drone/DesiredPose geometry_msgs/Twist  '{linear:  {x: 84.0, y: 00.0, z: 36.0}, angular: {x: 0.0,y: 0.0,z: 10.0}}'

rostopic echo /drone/cmd_vel
rostopic echo /hast/drone/DesiredPose
rostopic echo /hast/drone/CurrentPose

roslaunch rect.launch
rosrun hast observe
rosrun hast listen


rosrun image_view image_view image:=/ardrone/bottom/image_raw

rostopic pub -r 10 /ardrone/droneCmd geometry_msgs/Twist '{linear:  {x: 0.0, y: 0.0, z: 0.0}, angular: {x: 0.0,y: 0.0,z: 0.0}}'
rostopic pub -r 10 /ardrone/cmd_vel geometry_msgs/Twist '{linear:  {x: 0.0, y: 0.0, z: 0.0}, angular: {x: 0.0,y: 0.0,z: 0.0}}'

rostopic pub -r 10 /tb/cmd_vel geometry_msgs/Twist  '{linear:  {x: 0.1, y: 00.0, z: 0.0}, angular: {x: 0.0,y: 0.0,z: 0.0}}'
rostopic pub -r 10 /cmd_vel geometry_msgs/Twist  '{linear:  {x: 0.0, y: 00.0, z: 0.0}, angular: {x: 0.0,y: 0.0,z: 0.0}}'

rostopic pub -r 10 /cmd_vel geometry_msgs/Twist  '{linear:  {x: 0.5, y: 00.0, z: 0.0}, angular: {x: 0.0,y: 0.0,z: 0.0}}'

rostopic pub -1 /tb/cmd_vel geometry_msgs/Twist  '{linear:  {x: 0.5, y: 0.0, z: 0.0}, angular: {x: 0.0,y: 0.0,z: 0.0}}'
rostopic pub -1 /tb/cmd_vel geometry_msgs/Twist  '{linear:  {x: 0.0, y: 0.0, z: 0.0}, angular: {x: 0.0,y: 0.0,z: 0.0}}'
rostopic pub -r 10 /tb/cmd_vel geometry_msgs/Twist  '{linear:  {x: 0.5, y: 0.0, z: 0.0}, angular: {x: 0.0,y: 0.0,z: 0.0}}'
rostopic pub -r 10 /tb/cmd_vel geometry_msgs/Twist  '{linear:  {x: 0.0, y: 0.0, z: 0.0}, angular: {x: 0.0,y: 0.0,z: 0.0}}'


############################################------------------####################-HAST EXPERIMENT-########################-----------------############################################
----------------
rostopic pub -1 /ardrone/flattrim std_msgs/Empty
rostopic pub -1 /ardrone/imu_recalib std_msgs/Empty
rostopic pub -1 /ardrone/reset std_msgs/Empty
rostopic pub -1 /ardrone/land std_msgs/Empty
rostopic pub -1 /ardrone/takeoff std_msgs/Empty
rosrun odom_from_ar_marker odom_from_ar_marker_all

rostopic pub -1 /hast/shutdown hast/flag '{flag: {True}}'
rostopic pub -1 /hast/shutdown hast/flag '{flag: {False}}'
rostopic pub -r 10 /hast/shutdown hast/flag '{flag: {True}}'


rostopic pub -1 /hast/shutdown hast/flag "{flag: 'true'}"
rostopic pub -1 /hast/shutdown hast/flag '[true]'

rosservice call /hast/stereo/OdomSwitch "{flip: {true}}"
rosservice call /hast/stereo/OdomSwitch "{flip: {true}, mode: {true}}"


rostopic pub -1 /ardrone/cmd_vel geometry_msgs/Twist '{linear:  {x: 0.0, y: 0.0, z: 0.0}, angular: {x: 0.0,y: 0.0,z: 0.0}}'


Zero
rostopic pub -r 10 /drone/cmd_vel geometry_msgs/Twist '{linear:  {x: 0.0, y: 0.0, z: 0.0}, angular: {x: 0.0,y: 0.0,z: 0.0}}'

Left
rostopic pub -r 10 /drone/cmd_vel geometry_msgs/Twist '{linear:  {x: 0.0, y: 0.05, z: 0.0}, angular: {x: 0.0,y: 0.0,z: 0.0}}'

Right
rostopic pub -r 10 /drone/cmd_vel geometry_msgs/Twist '{linear:  {x: 0.0, y: -0.05, z: 0.0}, angular: {x: 0.0,y: 0.0,z: 0.0}}'

Yaw
rostopic pub -r 10 /drone/cmd_vel geometry_msgs/Twist '{linear:  {x: 0.0, y: 0.0, z: 0.0}, angular: {x: 0.0,y: 0.0,z: 0.05}}'

-----------------M file from c++

	std::FILE * pFile;
			char s_filename[100];
			strcpy(s_filename, "/home/turtlebot/ros/hast/Data/hover.m");
			ROS_INFO(s_filename);
			pFile = std::fopen (s_filename,"w");
			fprintf (pFile,"clc; \nclear all;\nclose all;\n\n");
			fprintf (pFile,"%% g_ConPar_P = %6.4f \n%% g_ConPar_R = %6.4f \n%% g_max = %6.4f \n", g_ConPar_P, g_ConPar_R, g_max);
			fprintf (pFile,"%% g_eps =%6.4f \n%% dwellOn = %i \n%% dwellOff = %i \n", g_eps, dwellOn, dwellOff);

---------------- Copying Files


scp /home/turtlebot/ros/hast/src/* benjamin@155.246.82.177:/Users/benjamin/Documents/ros_data/hast/src/

cp 192.168.1.1:/data/config.ini ~/config.ini

curl -O http://url.com/file.txt ftp://ftp.com/moo.exe -o moo.jpg

curl 192.168.1.1:/data/config.ini

To read ARdrone config files:
telnet 192.168.1.1
cd data
vi config.ini
or
grep euler config.ini



------------------

CONTROL:euler_angle_max
Description :
CAT_USER | Read/Write
Maximum bending angle for the drone in radians, for both pitch and roll angles.
The progressive command function and its associated AT command refer to a percentage of this value. Note : For
AR.Drone 2.0 , the new progressive command function is preferred (with the corresponding AT command).
This parameter is a positive floating-point value between 0 and 0.52 (ie. 30 deg). Higher values might be available
on a specific drone but are not reliable and might not allow the drone to stay at the same altitude.
This value will be saved to indoor/outdoor_euler_angle_max, according to the CONFIG:outdoor setting. AT command example : AT*CONFIG=605,"control:euler_angle_max","0.25"
API use example :
###
	float eulerMax = 0.25;
	ARDRONE_TOOL_CONFIGURATION_ADDEVENT (euler_angle_max, &eulerMax, myCallback);
##




sudo iwconfig wlan0 essid ardrone2_234879
sudo iwconfig wlan0 essid dd-wrt

wireless-essid ardrone2_234879
iwconfig wlan0 essid



rostopic pub -1 /hast/stereoOnOFF hast/flag '{flag: true}'

rostopic pub -1 /hast/stereoOnOFF hast/flag '{flag: 1}'

open .bash_history


