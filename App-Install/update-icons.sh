#!/bin/bash

# Create new icons file for jwm

echo "<JWM>" > /etc/jwm/.jwm/icons
echo "<IconPath>/usr/share/pixmaps</IconPath>" >> /etc/jwm/.jwm/icons
find /usr/share/icons/ -type d | sed 's/$/<\/IconPath>/'|sed 's/^/<IconPath>/' >> /etc/jwm/.jwm/icons
echo "</JWM>" >> /etc/jwm/.jwm/icons

cat /etc/jwm/.jwm/icons
