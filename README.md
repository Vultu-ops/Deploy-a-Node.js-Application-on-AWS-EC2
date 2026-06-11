# Deploy-a-Node.js-Application-on-AWS-EC2
###############################
scripts/setup-node.sh
#!/bin/bash

#########################
#Author: Riya
#Date: 11/06/2026

set +x
set +oe

#This script set up the nodejs webiste.

#########################
#To update the virtual machine
sudo apt update -y
sudo apt upgrade -y

########################
#To Download a NodeJs and Npm
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs git

########################
#To check the version
node -v
npm -v

