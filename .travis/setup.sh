#!/bin/bash

go build -o bin/myawesomeapp -i .
go version

#Install Go
#wget https://golang.org/dl/go1.15.6.linux-amd64.tar.gz
#sudo tar -C /usr/local -xzf go1.15.6.linux-amd64.tar.gz
#sudo export PATH=$PATH:/usr/local/go/bin
#


# Install Singularity
export VERSION=3.7.0 && \
    wget https://github.com/sylabs/singularity/releases/download/v${VERSION}/singularity-${VERSION}.tar.gz && \
    tar -xzf singularity-${VERSION}.tar.gz && \
    cd singularity
    
    ./mconfig && \
    make -C ./builddir && \
    sudo make -C ./builddir install
    
    . /usr/local/etc/bash_completion.d/singularity
        