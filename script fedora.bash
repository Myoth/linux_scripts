!#/bin/bash

dnf update -y
dnf upgrade -y

#downloading vlc
dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
dnf install vlc -y
dnf install python-vlc -y

#downloading telegram
dnf install telegram-desktop -y

#downloading htop, mc, xterm, acpi, tlp
dnf install htop mc xterm acpi tlp -y
