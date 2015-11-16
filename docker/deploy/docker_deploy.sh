#!/bin/bash
#Script for Ubuntu 14.04

# Update
echo "[UPDATE] "
sudo apt-get update -y

# Docker + Docker-compose installation
if [[ ! $(which wget) ]]
then
	echo "[INSTALL] wget"
	sudo apt-get install wget
fi

if [[ (! $(which docker)) && (! $(which docker.io)) ]]
then
	echo "No docker installation. Starting the download."
else
	sudo service docker stop
fi
echo "[INSTALL] docker"
wget -qO- https://get.docker.com/ | sh
sudo service docker start

# Add the current user to the group
echo "Current user will be added to the group docker"
sudo usermod -a -G docker ${USER}
sudo service docker restart
#newgrp docker
