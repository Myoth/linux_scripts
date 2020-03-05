#!/bin/bash
#
#RUN AS ROOT

#syncing the repos
xbps-install -S 

#updating xbps if needed
xbps-install -u xbps

#updating your system
xbps-install -Su

#installing KDE-plasma and its base apps
xbps-install -Su kde5 && kde5-baseapps

#removing XFCE4 and its software
xbps-remove -oR xfce4

#installing various software
xbps-install telegram-desktop && mpd && cantata && libreoffice-kde && flameshot && anki && acpi && neofetch && git && cmake

#installing spotify through the non-free repo
xbps-install -S void-repo-nonfree
xbps-install -Su
xbps-install -Su spotify

#adding the thermal monitor
git clone --depth=1 https://github.com/kotelnik/plasma-applet-thermal-monitor
cd plasma-applet-thermal-monitor/
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/usr
sudo make install

