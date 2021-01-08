#!/bin/bash
fileid="10-CFtvKabLEEUe7j7kCCaL2_RQ53gOm3"
filename="perceptionDev.sif"
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}