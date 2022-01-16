---
title: "X"
tags: [ "Documentation", "system" ]
---
X is a server which listens to requests for display.

Basic configurations are under /etc/X11, but xorg.conf is generally no longer used.

Examples can be found under /usr/share/X11/xorg.conf.d/

The xorg displays a section, then identifiers, then some options, then ends the section.

> Section "InputDevice"

> # generated from default

> Identifier

> "Mouse0"

> Driver

> "mouse"

> Option

> "Protocol" "auto"

> Option

> "Device" "/dev/psaux"

> Option

> "Emulate3Buttons" "no"

> Option

> "ZAxisMapping" "4 5"

> EndSection

# Research
See current settings with:

xdpyinfo | less

Basic info can often be gained with:

> man ati

> man Radeon

Internet resources are available at www.x.org/wiki/Projects/Drivers/

# Display Manager
This presents login options, then starts the desktop.  One is LightDM manager.

The program reads the configuration files in the order of: /usr/share/lightdm/lightdm.conf.d/, /etc/lightdm/lightdm.conf.d/, then /etc/lightdm/lightdm.conf.

The file /usr/share/lightdm/lightdm.conf.d/50-gues-wrapper.conf

# X defaults

~/.Xresources and ~/.Xdefaults load basic X settings.

Xdefaults is loaded each time if no Xresources is present.

If Xresources is present, Xdefaults it ignored.  Xresources is loaded with:

> xrdb ~/.Xresources 

