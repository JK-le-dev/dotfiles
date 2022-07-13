#!/bin/bash

#Lists of apps to download
snapApps="brave joplin-desktop todoist spotify"
snapClassicApps=("code" "intellij-idea-community" "pycharm-community")
flatpak="yuzu"

#Repos other than Arch
sudo snap install $snapApps &&
sudo flatpak install $flatpak && 

for app in $snapClassicApps; do
	sudo snap install $app
done
