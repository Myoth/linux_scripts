#!/bin/bash

#adding the sources for Telegram, Spotify, the wifi card's firmware and the backports for flameshot
cp /etc/apt/sources.list /etc/apt/sources.list_original
cat <<XXX >/etc/apt/sources.list
# deb cdrom:[devuan_ascii_2.0.0_amd64_netinst]/ ascii main non-free
# deb cdrom:[devuan_ascii_2.0.0_amd64_netinst]/ ascii main non-free

deb http://fr.deb.devuan.org/merged ascii main contrib non-free
deb-src http://fr.deb.devuan.org/merged ascii main

deb http://fr.deb.devuan.org/merged ascii-security main contrib non-free
deb-src http://fr.deb.devuan.org/merged ascii-security main

deb http://fr.deb.devuan.org/merged ascii-updates main contrib non-free
deb-src http://fr.deb.devuan.org/merged ascii-updates main

deb http://ppa.launchpad.net/atareao/telegram/ubuntu xenial main
deb-src http://ppa.launchpad.net/atareao/telegram/ubuntu xenial main

deb http://repository.spotify.com stable non-free

deb http://deb.devuan.org/merged ascii-backports main
deb-src http://deb.devuan.org/merged ascii-backports main 
XXX

#adding the keys to download telegram and spotify
apt install dirmngr -y
apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 4773BD5E130D1D45
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 36FD5529

#updating the repositories
apt update && apt upgrade -y

#install the software
apt install spotify-client -y
apt install telegram -y
apt install flameshot -y
apt install acpi -y
apt install disk-manager -y

#install the wifi firmware
apt install firmware-iwlwifi -y
modprobe -r iwlwifi ; modprobe iwlwifi

#various software
apt install mc vlc htop neofetch -y

#Thermal Monitor for KDE


#removing the backports to not fuck up the system
sed -i '18s/deb/#deb/g'    # a tester pour commenter la 18eme ligne (remplace deb par #deb)
sed -i '19s/deb/#deb/g'    # a tester pour commenter la 18eme ligne

#not start ssh at boot
touch /etc/ssh/sshd_not_to_be_run
