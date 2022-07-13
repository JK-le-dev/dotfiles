#!/bin/bash

#Lists of apps to download
snap
snapApps="brave joplin-desktop todoist spotify"
flatpak="yuzu"

#Repos other than Arch
su
snap install $snapApps &&
flatpak install $flatpak && 
snap install code --classic &&
snap install intellij-idea-community --classic &&
snap install pycharm-community --classic
