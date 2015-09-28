#!/usr/bin/env bash

# ffmpeg repository
sudo apt-add-repository ppa:mc3man/gstffmpeg-keep
sudo apt-get update
sudo apt-get install -y ffmpeg gstreamer0.10-ffmpeg

sudo apt-get install -y python-numpy

# From OpenCV docs http://docs.opencv.org/master/d7/d9f/tutorial_linux_install.html
sudo apt-get install -y build-essential
sudo apt-get install -y cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev

# If code is provided just `pull`
if [ -d /vagrant/opencv ]
then
    cp -R /vagrant/opencv /home/vagrant/
    cd /home/vagrant && git pull
else
    git clone https://github.com/Itseez/opencv.git
fi

mkdir /home/vagrant/opencv/build
cd /home/vagrant/opencv/build && cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local \
				       -D BUILD_TESTS=OFF -D BUILD_PERF_TESTS=OFF -D BUILD_EXAMPLES=OFF \
				       -D WITH_OPENCL=OFF -D WITH_CUDA=OFF -D BUILD_opencv_gpu=OFF \
				       -D BUILD_opencv_gpuarithm=OFF -D BUILD_opencv_gpubgsegm=OFF \
				       -D BUILD_opencv_gpucodec=OFF -D BUILD_opencv_gpufeatures2d=OFF \
				       -D BUILD_opencv_gpufilters=OFF -D BUILD_opencv_gpuimgproc=OFF \
				       -D BUILD_opencv_gpulegacy=OFF -D BUILD_opencv_gpuoptflow=OFF \
				       -D BUILD_opencv_gpustereo=OFF -D BUILD_opencv_gpuwarping=OFF \
				       -D PYTHON2_EXECUTABLE=/usr/bin/python2.7 \
				       -D PYTHON_INCLUDE_DIRS=/usr/include/python2.7 \
				       -D PYTHON_LIBRARY=/usr/lib/x86_64-linux-gnu/libpython2.7.so \
				       -D PYTHON_PACKAGES_PATH=/usr/lib/python2.7/site-packages \
				       -D PYTHON2_NUMPY_INCLUDE_DIRS=/usr/lib/python2.7/dist-packages/numpy \
				       ..

cd /home/vagrant/opencv/build && make -j3
cd /home/vagrant/opencv/build && sudo make install
