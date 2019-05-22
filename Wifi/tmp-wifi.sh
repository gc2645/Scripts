  ip link set wlp109s0 up
#  iw wlp109s0 scan|grep SID
  wpa_supplicant -B -D wext -i wlp109s0 -c wpa_supplicant.conf 
#  iw wlp109s0 link
  dhclient wlp109s0
  ip a
