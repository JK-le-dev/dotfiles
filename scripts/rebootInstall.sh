#!/bin/bash

#Lists of apps to download
pacmanApps="libreoffice-fresh htop trash-cli vim libreoffice-fresh imwheel grub-customizer piper ncdu gnome-keyring libgnome-keyring libsecret imagemagick alacritty tmux tree npm cmake"
yayApps="onedriver pfetch snapd flatpak jdk17-openjdk rclone-bin rclone-browser pulseway-bin alacritty-themes konsave"
snapApps="brave joplin-desktop todoist spotify"
snapClassicApps=("code" "intellij-idea-community" "pycharm-community")

getYay () {
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~
}

time-datectl set-local-rtc 0

#Arch Repos
getYay &&
sudo pacman -Syu $pacmanApps --noconfirm &&
yay -S $yayApps --noconfirm &&

#Setting up snap
sudo systemctl enable --now snapd.socket &&
sudo ln -s /var/lib/snapd/snap /snap &&

#Repos other than Arch
sudo snap install $snapApps &&

for app in $snapClassicApps; do
	sudo snap install $app
done
