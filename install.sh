#/bin/bash
# Install driver
apt update -y
apt install ubuntu-drivers-common -y
ubuntu-drivers install --gpgpu nvidia:535-server 
apt install nvidia-utils-535 -y
apt install nvidia-driver-535 -y
nvidia-smi

# Install nvidia driver
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2404/x86_64/cuda-keyring_1.1-1_all.deb
dpkg -i cuda-keyring_1.1-1_all.deb -y
apt-get update -y
apt-get install cuda-toolkit -y
apt-get install nvidia-gds -y

# Install Anaconda
wget https://repo.anaconda.com/archive/Anaconda3-2024.06-1-Linux-x86_64.sh
bash Anaconda3-2024.06-1-Linux-x86_64.sh -b
rm Anaconda3-2024.06-1-Linux-x86_64.sh

# Install Fooocus
source ~/.bashrc
cd /root/
git clone https://github.com/lllyasviel/Fooocus.git
cd /root/Fooocus
/root/anaconda3/bin/conda init
/root/anaconda3/bin/conda env create -f environment.yaml
/root/anaconda3/bin/conda activate /root/anaconda3/envs/fooocus/
pip install -r requirements_versions.txt
