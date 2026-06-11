#!/bin/bash

########################################

# Author: Riya Singh

# Date: 11-06-2026

# Description: Deploy Node.js application

# on Ubuntu EC2 instance

########################################

set -e

REPO_URL="https://github.com/verma-kunal/AWS-Session.git"
APP_DIR="AWS-Session"

echo "Cloning repository..."

if [ ! -d "$APP_DIR" ]; then
git clone "$REPO_URL"
else
echo "Repository already exists. Pulling latest changes..."
cd "$APP_DIR"
git pull
cd ..
fi

echo "Moving to application directory..."
cd "$APP_DIR"

echo "Installing dependencies..."
npm install

echo "Starting application..."
npm start
