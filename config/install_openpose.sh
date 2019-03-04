## Build opencv from source 
	mkdir -p ~/opencv/opencv && cd ~/opencv/opencv && git init 
	git remote add gh git@github.com:opencv/opencv.git && git pull gh master && git fetch gh && git checkout 3.4.5

	mkdir -p ~/opencv/opencv_contrib && cd ~/opencv/opencv_contrib && git init 
	git remote add gh git@github.com:opencv/opencv_contrib.git && git pull gh master && git fetch gh && git checkout 3.4.5

	mkdir -p ~/opencv/opencv/build && cd ~/opencv/opencv/build && cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local ..
	make -j7 # runs 7 jobs in parallel
	sudo make install #To install libraries, execute the following command from build directory 

## install cudnn
	### Download from https://developer.nvidia.com/rdp/cudnn-download
		cd ~/Downloads/ && tar -xzvf cudnn-10.0*.tgz

		sudo cp cuda/include/cudnn.h /usr/local/cuda/include
		sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
		sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*


		# Install the runtime library, for example:
		sudo dpkg -i libcudnn7_*_amd64.deb

		# Install the developer library, for example:
		sudo dpkg -i libcudnn7-dev_7*_amd64.deb

		# Install the code samples and the cuDNN Library User Guide, for example:
		sudo dpkg -i libcudnn7-doc_7*_amd64.deb

	### Verifying installation
		# Copy the cuDNN sample to a writable path.
		cp -r /usr/src/cudnn_samples_v7/ $HOME

		# Go to the writable path.
		cd  $HOME/cudnn_samples_v7/mnistCUDNN

		# Compile the mnistCUDNN sample.
		make clean && make

		# Run the mnistCUDNN sample.
		./mnistCUDNN

		# remove test files
		rm -rf ~/cudnn_samples_v7



## Download and build openpose
# https://github.com/CMU-Perceptual-Computing-Lab/openpose/blob/master/doc/installation.md
	sudo apt install cmake-qt-gui
	sudo apt-get install -y libgoogle-glog-dev protobuf-compiler install libatlas-base-dev libeigen3-dev 

	mkdir -p ~/CMU/ && cd ~/CMU && git clone https://github.com/CMU-Perceptual-Computing-Lab/openpose 
	cd ~/CMU/openpose && git pull origin master 
	. ./scripts/ubuntu/install_deps.sh
	. ./models/getModels.sh

	mkdir -p cd ~/CMU/openpose/build && cd ~/CMU/openpose/build && cmake .. # This takes a while, just be patient
	cmake-gui
	# "Where is the source code?" /home/benjamin/CMU/openpose
	# "Where to build the binaries?" /home/benjamin/CMU/openpose/build
	# check BUILD_PYTHON
	# check USE_PYTHON_INCLUDE_DIR
	## Install Eigen
		# ### Download from here: http://eigen.tuxfamily.org/index.php?title=Main_Page#Download
		# extract to ~/eigen
		# pip install pytest --user
		# pip3 install pytest --user
		# check PYBIND11_PYTHON_INSTALL
		# check PYTBIND_TEST
		# set WITH_EIGEN to APT_GET

	make
	# make -j4
	# make -j`nproc`

	cd ~/CMU/openpose/build && sudo make install


	

cmake -DOpenCV_INCLUDE_DIRS=/home/"${USER}"/opencv/opencv/build/install/include \
  -DOpenCV_LIBS_DIR=/home/"${USER}"/softwares/opencv/build/install/lib \
  -DCaffe_INCLUDE_DIRS=/home/"${USER}"/softwares/caffe/build/install/include \
  -DCaffe_LIBS=/home/"${USER}"/softwares/caffe/build/install/lib/libcaffe.so -DBUILD_CAFFE=OFF ..
	


	
	# cmake -DOpenCV_CONFIG_FILE=/home/"${USER}"/softwares/opencv/build/unix-install/OpenCVConfig.cmake ..

	# mkdir -p cd ~/CMU/openpose/build && cd ~/CMU/openpose/build

	# make -j`nproc`
	# sudo make install

	# cmake ..
	# cd ~/CMU/openpose/build && sudo make install



	# cmake -DOpenCV_INCLUDE_DIRS=/usr/local/opencv/include -DOpenCV_LIBS_DIR=/usr/local/opencv/lib ..

	


	# cmake -DOpenCV_INCLUDE_DIRS=/home/"${USER}"/opencv/opencv/include -DOpenCV_LIBS_DIR=/home/"${USER}"/softwares/opencv/build/install/lib ..

	# cmake -DOpenCV_INCLUDE_DIRS=/home/"${USER}"/softwares/opencv/build/install/include -DOpenCV_LIBS_DIR=/home/"${USER}"/softwares/opencv/build/install/lib ..
	# cmake -DOpenCV_CONFIG_FILE=/home/"${USER}"/softwares/opencv/build/install/share/OpenCV/OpenCVConfig.cmake ..


# install openpose with tensor flow
	## pip install tensor flow with GPU
	

	mkdir -p ~/ros/src/tf-pose-estimation && cd ~/ros/src/tf-pose-estimation && git init && git remote add gh git@github.com:benjaminabruzzo/tf-pose-estimation.git
	git pull gh master

	sudo apt-get install -y swig
	pip install tensorflow-gpu --user
	pip3 install tensorflow-gpu --user
	cd ~/ros/src/tf-pose-estimation && pip3 install -r requirements.txt

	cd tf_pose/pafprocess && swig -python -c++ pafprocess.i && python3 setup.py build_ext --inplace





# installing ROS enabled openpose
	export OPENPOSE_HOME='/home/"${USER}"/CMU/openpose'
	echo "export OPENPOSE_HOME='/home/"${USER}"/CMU/openpose'" >> ~/.bashrc
	mkdir -p ~/ros/src/openpose_ros && cd ~/ros/src/openpose_ros && git init && git remote add gh git@github.com:benjaminabruzzo/ros-openpose.git
	git pull gh master
	# sudo apt-get install -y ros-indigo-image-common ros-indigo-vision-opencv ros-indigo-video-stream-opencv ros-indigo-image-view
	cd ~/ros && catkin build openpose_ros_node





	
	mkdir -p ~/ros/src/openpose_ros && cd ~/ros/src/openpose_ros && git init && git remote add gh git@github.com:benjaminabruzzo/openpose_ros.git
	git pull gh master
	cd ~/ros && catkin build openpose_ros_pkg


	mkdir -p ~/ros/src/openpose_ros && cd ~/ros/src/openpose_ros && git init && git remote add gh git@github.com:westpoint-robotics/openpose_ros.git
	git pull gh master
	cd ~/ros && catkin build openpose_ros






#  got this thing working now. I followed this : https://answers.ros.org/question/242376/having-trouble-using-cuda-enabled-opencv-with-kinetic/?answer=242935#post-id-242935

# The key was that I had to rebuild all other packages also which were dependent upon OpenCV (vision_opencv which has cv_bridge). Also, in my cmakelist file, I have include all OpenCV packages and libraries for my project before the catkin packages. I dont know currently if it played a major role, but atleast its working now.

# If the problem still persists, please check your $CMAKE_PREFIX_PATH and $LD_LIBRARY_PATH. They should have the /usr/local (where your custom OpenCV is present) path before any of the ROS paths.


# Hello previous me,

# So you have the opencv3 package installed, which provides libraries in /opt/ros/kinetic/lib, and you also have OpenCV compiled from source, installed to usr/local. The trick is to tell catkin to use the libraries from usr/local.

# By default, catkin is hardwired to look for packages in your workspace, then in /opt/ros/kinetic. CMake by itself will use the libraries in /usr/local. I tried to prioritize /usr/local by modifying the CMAKE_PREFIX_PATH environment variable, as suggested in pre kinetic posts, but no luck.

# So if I cannot modify catkin itself, I should to explicitly tell CMake which OpenCV to use. I had to change my declaration from

# find_package(OpenCV REQUIRED)

# to

# find_package(OpenCV REQUIRED
# NO_MODULE # should be optional, tells CMake to use config mode
# PATHS /usr/local # look here
# NO_DEFAULT_PATH) # and don't look anywhere else

# So that will pull in the correct libraries. If another package is built that requires OpenCV, catkin will also pull in the wrong dependencies. Mixed dependencies is a bad thing. So you have to add the modified OpenCV configuration to any other packages that require OpenCV. This includes the vision_opencv package that provides cv_bridge.

# UPDATE 10/12/2017: Please see my fork of vision_opencv for the necessary changes and my cvTest example package. In the example, I demonstrate the use of my custom version of OpenCV 3.3 build with CUDA 8.
