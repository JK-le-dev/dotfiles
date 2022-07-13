#!/bin/bash

#Lists of apps to download
pacmanApps="os-prober htop trash-cli vim libreoffice-fresh imwheel grub-customizer piper ncdu gnome-keyring libgnome-keyring imagemagick alacritty tmux tree npm cmake rclone redshift"
yayApps="onedriver pfetch snapd flatpak jdk17-openjdk rclone-bin rclone-browser pulseway-bin alacritty-themes konsave powershell-bin"
snapApps="brave joplin-desktop todoist spotify"
snapClassicApps=("code" "intellij-idea-community" "pycharm-community")
flatpak="yuzu"

getYay () {
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si
	cd ~
}
time-datectl set-local-rtc 1

#Arch Repos
getYay &&
sudo pacman -Syu $pacmanApps --noconfirm &&
yay -S $yayApps --noconfirm &&

sudo systemctl enable --now snapd.socket &&
sudo ln -s /var/lib/snapd/snap /snap 
