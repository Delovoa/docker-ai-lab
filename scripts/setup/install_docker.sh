#!/bin/bash

######################
#   Install Docker   #
######################

# Exit if a command fails
set -e

# Uninstall old docker versions
sudo apt remove -y docker.io docker-compose docker-compose-v2 docker-doc podman-docker containerd runc || true

# Install prerequisites
sudo apt update
sudo apt install -y ca-certificates curl gnupg lsb-release

# Create keyrings directory
sudo install -m 0755 -d /etc/apt/keyrings

# Add Docker's GPG key
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add Docker repository
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null <<EOF
deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable
EOF

# Update package index
sudo apt update

# Install Docker packages
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Start and enable Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Create the docker group
sudo groupadd -f docker

# Add your user to the docker group
sudo usermod -aG docker $USER

# Activate the changes to groups
newgrp docker

# Success message
echo "SUCCESS: Docker installation complete!"

# To verify installation, run:
# docker run hello-world