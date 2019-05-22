#!/bin/bash

# Openbox Window Manager and Obmenu-Generator

# Install Xserver and Basic Window Manager
apt install -y xorg xinit jwm

#Install Basic Desktop Environment
apt install -y lxde --no-install-recommends

# Install Openbox
apt install -y openbox

# Install and Configure obmenu-generator
apt-get install -y build-essential cpanminus git obconf
git clone git://github.com/trizen/obmenu-generator

wait
cp obmenu-generator/obmenu-generator /usr/bin
cp -r obmenu-generator/schema.pl ~/.config/obmenu-generator
cpanm Linux::DesktopFiles
cpanm Data::Dump
wait

chmod 777 /usr/bin/obmenu-generator
obmenu-generator -p -i

exit;


