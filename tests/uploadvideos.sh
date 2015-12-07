#!/bin/bash

if [[ ! $(which curl) ]]
then
	echo "[INSTALL] curl"
	sudo apt-get install curl
fi

addr='172.17.8.102:31333'
video='/home/mlacaud/Vidéos/1.mp4'

if [ $# -ne 1 ]
then
  echo "Please write : ./uploadvideos [number of videos]"
else
  echo ""
i=1
while [ $i -le $1 ]
do
   echo "Send video ${i}"
   echo "Response:"
   curl -F "file=@${video}" http://${addr}/api/content
   echo ""
   echo ""
   i=$(($i+1))
done
fi
