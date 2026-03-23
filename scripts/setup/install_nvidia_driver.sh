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

# Success message
echo "SUCCESS: NVIDIA Driver installation complete!"
echo ""
echo "========================================"
echo " A reboot is required to complete setup "
echo "========================================"

# To verify installation (after rebooting), run:
# nvidia-smi