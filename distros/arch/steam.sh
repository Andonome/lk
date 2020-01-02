#!/bin/bash

sudo pacman -S flatpak

flatpak --user remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak --user install flathub com.valvesoftware.Steam

flatpak run com.valvesoftware.Steam

