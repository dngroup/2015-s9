#!/bin/bash
#Script for Ubuntu 14.04


#sudo docker-machine create -d virtualbox local

#eval "$(docker-machine env local)"
#echo "after eval"
docker pull swarm
echo "after pull"
token=$(docker run swarm create)

echo "Token = ${token}"

docker-machine create -d virtualbox --swarm --swarm-master --swarm-discovery token://${token} swarm-master

docker-machine create -d virtualbox --swarm --swarm-discovery token://${token} swarm-agent-00
docker-machine create -d virtualbox --swarm --swarm-discovery token://${token} swarm-agent-01
docker-machine create -d virtualbox --swarm --swarm-discovery token://${token} swarm-agent-02
