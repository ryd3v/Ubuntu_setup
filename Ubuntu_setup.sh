#!/usr/bin/env bash

# Remove unnecessary packages
sudo apt purge -y apport apport-symptoms popularity-contest ubuntu-report whoopsie
sudo apt autoremove -y

# Update and install basic tools
sudo apt update && sudo apt upgrade -y

sudo apt install -y build-essential dkms gcc make perl curl wget vlc ffmpeg python3-pip git default-jre mediainfo-gui libimage-exiftool-perl mat2 subversion ripgrep jq libncurses5-dev libffi-dev gnome-tweaks transmission openjdk-17-jdk openjdk-17-jre autoconf libtool automake zip ant libde265-dev libheif-dev libpq-dev testdisk libafflib-dev libewf-dev libvhdi-dev libvmdk-dev libgstreamer1.0-0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio libcanberra-gtk-module bleachbit yarn openvpn tor proxychains exfat-fuse exfatprogs lm-sensors fancontrol read-edid i2c-tools gparted kleopatra

# Install and configure specific tools
sudo snap install code --classic

# Fonts
sudo apt install fonts-roboto -y
sudo apt install fonts-jetbrains-mono -y

# Environment setup for Node.js and other dependencies
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install --lts

# Miscellaneous setup
sudo apt --fix-broken install
sudo apt update --fix-missing
sudo apt -y upgrade
sudo apt autoremove -y

# Flatpak
sudo apt install flatpak -y
sudo apt install gnome-software-plugin-flatpak -y
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

sudo flatpak install flathub com.mattjakeman.ExtensionManager -y
sudo flatpak install flathub com.spotify.Client -y
sudo flatpak install flathub com.discordapp.Discord -y

# Required for PyGobject
sudo apt-get install -y python3-venv python3-wheel python3-dev
sudo apt-get install -y libgirepository1.0-dev build-essential \
  libbz2-dev libreadline-dev libssl-dev zlib1g-dev libsqlite3-dev wget \
  curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libcairo2-dev

sudo apt install -y libasound-dev portaudio19-dev libportaudio2 libportaudiocpp0

sudo apt-get install --reinstall libgtk-3-common
sudo apt install -y gir1.2-gtkclutter-1.0 gir1.2-gtop-2.0

echo "All tools installed. Please reboot."
exit 0
