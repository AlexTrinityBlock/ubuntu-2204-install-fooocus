#/bin/bash

# To /root
cd /root/

# Install driver
apt update -y
apt install ubuntu-drivers-common -y
ubuntu-drivers install --gpgpu nvidia:535-server 
apt install nvidia-utils-535 -y
apt install nvidia-driver-535 -y
nvidia-smi

# Install nvidia driver
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2404/x86_64/cuda-keyring_1.1-1_all.deb
dpkg -i cuda-keyring_1.1-1_all.deb
apt-get update -y
apt-get install cuda-toolkit -y
apt-get install nvidia-gds -y

# Install Anaconda
wget https://repo.anaconda.com/archive/Anaconda3-2024.06-1-Linux-x86_64.sh
bash Anaconda3-2024.06-1-Linux-x86_64.sh -b
rm Anaconda3-2024.06-1-Linux-x86_64.sh

# Install Fooocus
source ~/.bashrc
git clone https://github.com/lllyasviel/Fooocus.git
cd /root/Fooocus
eval "$( /root/anaconda3/bin/conda shell.bash hook)" 
/root/anaconda3/bin/conda init --all
/root/anaconda3/bin/conda env create -f /root/Fooocus/environment.yaml
/root/anaconda3/bin/conda activate /root/anaconda3/envs/fooocus/
pip install -r /root/Fooocus/requirements_versions.txt

# Set default user password
wget -P /root/Fooocus/ https://raw.githubusercontent.com/AlexTrinityBlock/ubuntu-2204-install-fooocus/master/auth.json

# Replace default web ui for path setting
wget -P /root/Fooocus/ https://raw.githubusercontent.com/AlexTrinityBlock/ubuntu-2204-install-fooocus/master/webui.py
