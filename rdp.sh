#!/usr/bin/env bash

# Install packages

apt-get update
apt-get install xfce4 xfce4-goodies xorg dbus-x11 x11-xserver-utils xrdp firefox-esr -y
adduser xrdp ssl-cert  
systemctl enable xrdp

## Fix colord to allow all users to change colors

cat <<EOF > /etc/polkit-1/localauthority/50-local.d/45-allow-colord.pkla
[Allow Colord all Users]
Identity=unix-user:*
Action=org.freedesktop.color-manager.create-device;org.freedesktop.color-manager.create-profile;org.freedesktop.color-manager.delete-device;org.freedesktop.color-manager.delete-profile;org.freedesktop.color-manager.modify-device;org.freedesktop.color-manager.modify-profile
ResultAny=no
ResultInactive=no
ResultActive=yes
EOF

# Reboot
reboot now