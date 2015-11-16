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
	echo "[INSTALL] docker"
	wget -qO- https://get.docker.com/ | sh
fi

if [[ ! $(which docker-compose) ]]
then
	if [[ ! $(which curl) ]]
	then
		echo "[INSTALL] curl"
		sudo apt-get install curl
	fi

	echo "[INSTALL] docker-compose"
	curl -L https://github.com/docker/compose/releases/download/1.5.0/docker-compose-`uname -s`-`uname -m` > docker-compose
	sudo mv docker-compose /usr/local/bin/
	sudo chmod +x /usr/local/bin/docker-compose
fi

# Creation of the docker group
if [[ ! $(egrep -i "^docker" /etc/group) ]]
then
	echo "Creation of the group docker - You should log out and then log back in to make sure the changes took effect"
	sudo groupadd docker
	sudo chown root:docker /var/run/docker.sock
fi
