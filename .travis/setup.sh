#!/bin/bash -ex

sudo sed -i -e 's/^Defaults\tsecure_path.*$//' /etc/sudoers

# Check Python

echo "Python Version:"
python --version
pip install --user sregistry[all]
sregistry version

echo "sregistry Version:"

# Install Singularity

#SINGULARITY_BASE="${GOPATH}/src/github.com/sylabs/singularity"
#export PATH="${GOPATH}/bin:${PATH}"

#mkdir -p "${GOPATH}/src/github.com/sylabs"
#cd "${GOPATH}/src/github.com/sylabs"

#git clone -b release-3.2 https://github.com/sylabs/singularity
#cd singularity
#./mconfig -v -p /usr/local
#make -j `nproc 2>/dev/null || echo 1` -C ./builddir all
#sudo make -C ./builddir install
# Install Dependencies
sudo apt-get update && sudo apt-get install -y \
    build-essential \
    uuid-dev \
    libgpgme-dev \
    squashfs-tools \
    libseccomp-dev \
    wget \
    pkg-config \
    git \
    cryptsetup-bin

# Install Singularity
export VERSION=3.5.2 && \
    wget https://github.com/sylabs/singularity/releases/download/v${VERSION}/singularity-${VERSION}.tar.gz && \
    tar -xzf singularity-${VERSION}.tar.gz && \
    cd singularity
    
    ./mconfig && \
    make -C ./builddir && \
    sudo make -C ./builddir install
    echo "stuff has been installed stop travis stop"
    pwd

#wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=10-CFtvKabLEEUe7j7kCCaL2_RQ53gOm3' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=10-CFtvKabLEEUe7j7kCCaL2_RQ53gOm3" -O perceptionDev.sif && rm -rf /tmp/cookies.txt

#git clone https://github.com/umrover/mrover-workspace.git