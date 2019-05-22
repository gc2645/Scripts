#!/bin/bash 

if [ $USER != root ]; then
  echo -e $RED"Error: must be root! Exiting..."$ENDCOLOR
  exit 0
fi

YELLOW="\033[1;33m"; RED="\033[0;31m"; ENDCOLOR="\033[0m"

mkdir /data

device=$(blkid | grep $1 | cut -d\" -f2)
echo -e $YELLOW"Updating fstab with :"$ENDCOLOR 
echo "UUID=$device /data/ ext4 defaults 0 0"

echo "UUID=$device /data/ ext4 defaults 0 0" >> /etc/fstab
