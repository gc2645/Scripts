#!/bin/bash

# XFCE Install Script 

echo ""
read -p "Press [Enter] key to Install Xorg xinit and jwm..."

# Install Xserver and Basic Window Manager
apt install -y xorg xinit jwm xterm

echo ""
read -p "Press [Enter] key to Install xfce4..."

#Install Desktop Environment
apt install -y xfce4 --no-install-recommends
apt install -y xserver-xorg-input-synaptics
exit;



