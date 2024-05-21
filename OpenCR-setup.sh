#!/bin/bash

# Install required packages on the Raspberry Pi to upload the OpenCR firmware.
sudo dpkg --add-architecture armhf
sudo apt-get update
sudo apt-get install libc6:armhf

# Remove any existing opencr_update.tar.bz2 file.
rm -rf ./opencr_update.tar.bz2

# Download the firmware and loader, then extract the file.
wget https://github.com/ROBOTIS-GIT/OpenCR-Binaries/raw/master/turtlebot3/ROS1/latest/opencr_update.tar.bz2
tar -xvf opencr_update.tar.bz2

# Prompt for OpenCR port and model.
read -p "Enter the OpenCR port: " OPENCR_PORT
read -p "Enter the OpenCR model: " OPENCR_MODEL

# Upload firmware to the OpenCR.
cd ./opencr_update
./update.sh $OPENCR_PORT $OPENCR_MODEL.opencr