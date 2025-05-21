#!/bin/bash

echo "${PROJECT_NAME} starting ..."

set -euo pipefail

sudo dnf update
sudo dnf install wget ruby -y

cd /home/ec2-user

echo https://aws-codedeploy-${AWS_REGION}.s3.${AWS_REGION}.amazonaws.com/latest/install

wget https://aws-codedeploy-${AWS_REGION}.s3.${AWS_REGION}.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto

sudo systemctl enable codedeploy-agent
sudo systemctl start codedeploy-agent