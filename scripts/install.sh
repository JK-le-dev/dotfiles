#!/bin/bash

#Lists of apps to download
<<<<<<< HEAD
pacmanApps="yay htop trash-cli vim libreoffice imwheel grub-customizer piper ncdu gnome-keyring libsecret libgnome-keyring"
yayApps="onedriver pfetch snapd flatpak jdk17-openjdk rclone-bin rclone-browser pulseway-bin"
=======
pacmanApps="yay htop trash-cli vim libreoffice imwheel grub-customizer piper ncdu gnome-keyring libsecret libgnome-keyring imagemagick alacritty tmux"
yayApps="onedriver pfetch snapd flatpak jdk17-openjdk rclone-bin rclone-browser pulseway-bin alacritty-themes"
>>>>>>> newStuff
snapApps="brave joplin-desktop todoist spotify"
snapClassicApps=("code" "intellij-idea-community")
flatpakApps="yuzu"

#Arch Repos
sudo pacman -Syu $pacmanApps --noconfirm
yay -S $yayApps --noconfirm

#Setting up snap
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap

#Repos other than Arch
sudo snap install $snapApps
sudo flatpak install $flatpakApps

for app in $snapClassicApps; do
	sudo snap install $app
done
