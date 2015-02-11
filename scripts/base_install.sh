#!/usr/bin/env bash
sudo apt-add-repository ppa:mc3man/trusty-media
sudo apt-get update
sudo apt-get install -y vim build-essential python-software-properties
sudo apt-get install -y python-opencv python-numpy python-scipy ipython
sudo apt-get install -y x11-apps
sudo apt-get install -y gedit
sudo apt-get install -y ffmpeg gstreamer0.10-ffmpeg