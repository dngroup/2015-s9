#!/bin/bash
#Script for Ubuntu 14.04

echo $1
docker run -d -p 8300:8300 -p 8301:8301 -p 8301:8301/udp -p 8302:8302 -p 8302:8302/udp -p 8400:8400 -p 8500:8500 -p 8600:8600/udp  progrium/consul -join -advertise $1 -join $2
