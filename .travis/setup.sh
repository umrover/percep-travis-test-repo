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
VERSION=2.5.2
wget https://github.com/singularityware/singularity/releases/download/$VERSION/singularity-$VERSION.tar.gz
tar xvf singularity-$VERSION.tar.gz
cd singularity-$VERSION
./configure --prefix=/usr/local
make
sudo make install

git clone https://github.com/umrover/perception-dev-container.git