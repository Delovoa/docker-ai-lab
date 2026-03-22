##############################
#   Upgrade Linux Packages   #
##############################

#!/bin/bash

# Exit if a command fails
set -e

# Update package lists
sudo apt update

# Upgrade all packages
sudo apt upgrade -y

# Remove unnecessary packages
sudo apt autoremove -y

# Success message
echo "Success: All packages upgraded!"
