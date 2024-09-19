#!/bin/bash

echo "Updating package index..."
sudo apt update -y
sudo apt install nano curl wget net-tools -y

echo "Installing packages to allow apt to use a repository over HTTPS..."
apt-get install -y apt-transport-https ca-certificates curl software-properties-common

echo "Adding Docker’s official GPG key..."
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

echo "Setting up Docker’s stable repository..."
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

echo "Updating package index with Docker’s repo..."
apt-get update

echo "Installing Docker Engine..."
apt-get install -y docker-ce

echo "Starting Docker and enabling it to start on boot..."
systemctl start docker
systemctl enable docker

echo "Docker installation completed successfully."
