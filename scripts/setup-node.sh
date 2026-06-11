#!/bin/bash

########################################

# Author: Riya Singh

# Date: 11-06-2026

# Description: Setup Node.js environment

# on Ubuntu EC2 instance

########################################

set -e

echo "Updating system packages..."

sudo apt update -y
sudo apt upgrade -y

echo "Installing Node.js, npm and Git..."

curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs git

echo "Installed versions:"

node -v
npm -v
git --version

echo "Setup completed successfully."
