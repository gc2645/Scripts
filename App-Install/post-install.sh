#!/bin/bash

# Determine OS and Version Info
if [ -f /etc/os-release ]; then
    # freedesktop.org and systemd
    . /etc/os-release
    OS=$NAME
    VER=$VERSION_ID
elif type lsb_release >/dev/null 2>&1; then
    # linuxbase.org
    OS=$(lsb_release -si)
    VER=$(lsb_release -sr)
elif [ -f /etc/lsb-release ]; then
    # For some versions of Debian/Ubuntu without lsb_release command
    . /etc/lsb-release
    OS=$DISTRIB_ID
    VER=$DISTRIB_RELEASE
elif [ -f /etc/debian_version ]; then
    # Older Debian/Ubuntu/etc.
    OS=Debian
    VER=$(cat /etc/debian_version)
elif [ -f /etc/SuSe-release ]; then
    # Older SuSE/etc.
    echo "Script does not work on SuSE"
    exit;
    ...
elif [ -f /etc/redhat-release ]; then
    # Older Red Hat, CentOS, etc.
    echo "Script does not work on RedHat"
    exit;
    ...
else
    # Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
    OS=$(uname -s)
    VER=$(uname -r)
    echo "Script does not work on $OS $VER"
    exit;
fi

echo "Operating System = $OS"
echo "Version = $VER"
echo "ID Variable = $ID"

read -p "Press [Enter] key to continue..."

# Add Local Server to host files
echo "10.0.0.1    	gateway" >> /etc/hosts
echo "10.0.0.2    	dns" >> /etc/hosts
echo "10.0.0.248    	nuc" >> /etc/hosts
echo "10.0.0.250    	nuc-win" >> /etc/hosts
echo "192.168.8.248	nuc-e" >> /etc/hosts

# Configure APT Repositories
if [ "$ID" = "ubuntu" ]; then
	# Add Partners Repositories
	echo "deb http://archive.canonical.com/ubuntu bionic partner" >> /etc/apt/sources.list
	apt update
elif [ "$ID" = "debian" ]; then
	# Add contrib and non-free repositories
	apt install -y software-properties-common
	apt-add-repository contrib
	apt-add-repository non-free
	# Add stretch-backports repository
	echo "deb http://ftp.debian.org/debian stretch-backports main contrib non-free" >> /etc/apt/sources.list
	apt update
else 
	echo "this is fubar"
	exit;
fi

echo ""
read -p "Press [Enter] key to Install Basic Tools..."

# Install basic tools
apt install -y htop net-tools build-essential make sudo vim git hardinfo gvfs-backends wicd 

# Linux-Live tools
apt-get install --yes --no-install-recommends mc squashfs-tools genisoimage zip unzip psmisc net-tools \
alsa-utils man less xz-utils ca-certificates openssl acpid acpi-support-base powermgmt-base bzip2 gpart \
hdparm sdparm mdadm smartmontools dosfstools lsof htop gddrescue rsync netcat ssh gpm wireless-tools \
ntfs-3g rfkill file dnsmasq ntpdate dvd+rw-tools usb-modeswitch pm-utils

# Linux-Live Firmware
apt install --yes --no-install-recommends \
   firmware-linux-free \
   firmware-linux-nonfree \
   firmware-atheros \
   firmware-iwlwifi \
   firmware-zd1211 \
   firmware-realtek \
   firmware-bnx2 \
   firmware-brcm80211 \
   firmware-cavium \
   firmware-ipw2x00 \
   firmware-libertas \
   firmware-ti-connectivity \
   firmware-b43-installer

# Linux-Live kernel Headers
apt-get install aufs-dkms linux-headers-$(uname -r) --yes


# Configure git
git config --global user.email "gc2645@yahoo.com"
git config --global user.name "gc2645"

# Install Colorado Background Files
git clone https://github.com/gc2645/Backgrounds /usr/share/backgrounds/Colorado

echo ""
read -p "Press [Enter] key to Install Applications..."

# Install Applications
if [ "$ID" = "ubuntu" ]; then
apt install -y chromium-browser adobe-flashplugin grpn vlc transmission virtualbox remmina shotwell clementine plank slim
elif [ "$ID" = "debian" ]; then
	apt install -y chromium grpn vlc transmission shotwell clementine plank slim 
	apt install -y -t stretch-backports virtualbox remmina 
	wget  http://ftp.br.debian.org/debian/pool/main/f/fonts-smc-chilanka/fonts-smc-chilanka_1.3.1-1_all.deb
	dpkg -i fonts-smc-chilanka_1.3.1-1_all.deb
	wget https://raw.githubusercontent.com/cybernova/fireflashupdate/master/fireflashupdate.sh
	chmod +x fireflashupdate.sh
	./fireflashupdate.sh
else 
	echo "this is fubar"
	exit;
fi

echo ""
read -p "Press [Enter] key to Install Snap and Snap Applications..."

# Install Snap and Snap Applications
apt install -y snapd 
systemctl enable snapd
systemctl start snapd
snap install core
snap install skype --classic
snap install spotify


exit;


