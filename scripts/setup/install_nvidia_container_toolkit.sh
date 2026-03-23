#######################################
#  Install NVIDIA Container Toolkit   #
#######################################

# Add the NVIDIA Container Toolkit repository GPG key
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg

# Add the NVIDIA Container Toolkit repository to your sources list
curl -sL https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
  sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
  sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

# Update the package lists
sudo apt-get update

# Install the NVIDIA Container Toolkit packages
sudo apt-get install -y nvidia-container-toolkit

# Configure Docker to use the NVIDIA runtime:
sudo nvidia-ctk runtime configure --runtime=docker

# Restart the Docker daemon to apply the changes
sudo systemctl restart docker

# Success message
echo "SUCCESS: NVIDIA Container Toolkit installation complete!"

# To verify installation, run:
# docker run --rm --gpus all nvidia/cuda:13.2.0-cudnn-devel-ubuntu24.04 nvidia-smi
