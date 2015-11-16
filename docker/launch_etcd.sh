#!/bin/bash
#Script for Ubuntu 14.04

if [ $# -eq 0 ]
then
  echo "Please write : ./launch_etcd [name] [ip address] [url for discovery]"
else
  etcd -name $1 -initial-advertise-peer-urls http://$2:2380 \
    -listen-peer-urls http://$2:2380 \
    -listen-client-urls http://0.0.0.0:2379,http://0.0.0.0:4001\
    -advertise-client-urls http://$2:2379\
    -discovery $3
fi
