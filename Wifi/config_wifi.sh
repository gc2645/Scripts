  ip link set wlan0 up
  iw wlan0 scan|grep SID
  wpa_supplicant -B -D wext -i wlan0 -c wpa_supplicant.conf 
  iw wlan0 link
  dhclient wlan0
  ip a
