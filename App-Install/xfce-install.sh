#!/bin/bash

echo ""
read -p "Press [Enter] key to Install Xorg xinit and jwm..."

# Script to install jwm xfce4 and dockbarx 

# Install Xserver and Basic Window Manager
apt install -y xorg xinit jwm xterm

echo ""
read -p "Press [Enter] key to Install xfce4..."

#Install Desktop Environment
apt install -y xfce4-core
apt install -y fonts-smc-chilanka xserver-xorg-input-synaptics 

echo ""
read -p "Press [Enter] key to Dockbarx..."

# Install Dockbarx and plungins
add-apt-repository ppa:xuzhen666/dockbarx
apt-get update
apt-get install -y dockbarx

# If you want to use dockbarx as a Xfce panel applet you also need this command
apt-get install -y xfce4-dockbarx-plugin

#To get more themes for DockbarX and DockX use this command
apt-get install -y dockbarx-themes-extra

exit;


