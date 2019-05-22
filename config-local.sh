#!/bin/bash

# Add Local Server to host files
echo "10.0.0.1    	gateway" >> /etc/hosts
echo "10.0.0.2    	dns" >> /etc/hosts
echo "10.0.0.248    	nuc" >> /etc/hosts
echo "10.0.0.250    	nuc-win" >> /etc/hosts
echo "192.168.8.248	nuc-e" >> /etc/hosts

# Configure git
git config --global user.email "gc2645@yahoo.com"
git config --global user.name "gc2645"



