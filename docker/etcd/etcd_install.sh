#!/bin/bash
#Script for Ubuntu 14.04

cd ~
curl -L  https://github.com/coreos/etcd/releases/download/v2.2.1/etcd-v2.2.1-linux-amd64.tar.gz -o etcd-v2.2.1-linux-amd64.tar.gz
tar xzvf etcd-v2.2.1-linux-amd64.tar.gz
cd etcd-v2.2.1-linux-amd64

sudo cp ./etcd /usr/local/bin/etcd
sudo chmod +x /usr/local/bin/etcd
sudo cp ./etcdctl /usr/local/bin/etcdctl
sudo chmod +x /usr/local/bin/etcdctl

cd ..
rm -r etcd-v2.2.1-linux-amd64
