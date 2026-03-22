#!/bin/bash

############################
#  Install NVIDIA Driver   #
############################

# Exit if a command fails
set -e

# Download the latest NVIDIA driver
sudo apt-get install -y software-properties-common curl
sudo add-apt-repository -y ppa:graphics-drivers/ppa
sudo apt-get update
sudo ubuntu-drivers autoinstall

# Verify installation
nvidia-smi

#######################################
#  Install NVIDIA Container Toolkit   #
#######################################

# Exit if a command fails
set -e

# Detect distribution
distribution=$(. /etc/os-release; echo $ID$(echo $VERSION_ID | tr -d .))

# Add NVIDIA GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://nvidia.github.io/nvidia-docker/gpgkey | sudo gpg --dearmor -o /etc/apt/keyrings/nvidia-docker.gpg

# Add NVIDIA Docker repository
echo "deb [signed-by=/etc/apt/keyrings/nvidia-docker.gpg] https://nvidia.github.io/libnvidia-container/$distribution/$(dpkg --print-architecture) /" | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

# Install package
sudo apt update
sudo apt install -y nvidia-docker2

# Restart Docker
sudo systemctl restart docker

# Cleanup any outdated packages
sudo apt autoremove -y

# Verify installation
docker run --rm --gpus all nvidia/cuda nvidia-smi

# Success message
echo "SUCCESS: NVIDIA Container Toolkit installation complete!"
