#!/bin/bash
#Script for Ubuntu 14.04

#stop the rabbitmq-server, so the broker won't return an error
if [[ ! $(which rabbitmq-server) ]]
then
	sudo service rabbitmq-server stop
fi

docker run -d --name broker -P rabbitmq:3.5.3
docker run -d --name worker1 --link broker:amqp nherbaut/worker:jdev
docker run -d --name box -P --link broker:amqp nherbaut/dvd2c-box
docker run -d --name frontend -p 8080:8080 --link box:box nherbaut/frontend
