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
xbps-install -Su kde5 kde5-baseapps

#installing various software
xbps-install telegram-desktop mpd cantata libreoffice-kde flameshot anki acpi 

#installing spotify through the non-free repo
xbps-install -S void-repo-nonfree
xbps-install -Su
xbps-install -Su spotify

#removing XFCE4 and its software
xbps-remove -oR xfce4