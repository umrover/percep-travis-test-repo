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

# Install Singularity
VERSION=3.7.0
wget https://github.com/hpcng/singularity/releases/download/v3.7.0/singularity-3.7.0.tar.gz
tar xvf singularity-$VERSION.tar.gz
cd singularity-$VERSION
./configure --prefix=/usr/local
make
sudo make install

#wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=10-CFtvKabLEEUe7j7kCCaL2_RQ53gOm3' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=10-CFtvKabLEEUe7j7kCCaL2_RQ53gOm3" -O perceptionDev.sif && rm -rf /tmp/cookies.txt

#git clone https://github.com/umrover/mrover-workspace.git