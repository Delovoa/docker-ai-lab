#!/bin/bash

#####################################################
# Downloads the latest Linux package updates via APT
#####################################################

# Exit if a command fails
set -e

# Update package lists
sudo apt update

# Upgrade all packages
sudo apt upgrade -y

# Remove unnecessary packages
sudo apt autoremove -y

# Success message
echo "SUCCESS: All packages upgraded!"
