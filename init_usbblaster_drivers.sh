#!/bin/bash

# Sébastien Deriaz
# 30.09.2022
#
# Create /etc/udev/rules.d/92-usbblaster.rules
# and write its content
# From https://www.rocketboards.org/foswiki/Documentation/UsingUSBBlasterUnderLinux
# Works on Fedora 36


if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

FILE=/etc/udev/rules.d/92-usbblaster.rules

cat <<EOM >$FILE
# USB-Blaster
SUBSYSTEM=="usb", ATTRS{idVendor}=="09fb", ATTRS{idProduct}=="6001", MODE="0666"
SUBSYSTEM=="usb", ATTRS{idVendor}=="09fb", ATTRS{idProduct}=="6002", MODE="0666"

SUBSYSTEM=="usb", ATTRS{idVendor}=="09fb", ATTRS{idProduct}=="6003", MODE="0666"

# USB-Blaster II
SUBSYSTEM=="usb", ATTRS{idVendor}=="09fb", ATTRS{idProduct}=="6010", MODE="0666"
SUBSYSTEM=="usb", ATTRS{idVendor}=="09fb", ATTRS{idProduct}=="6810", MODE="0666"
EOM

echo "USB-Blaster permissions have been updated. Please disconnect and reconnect any USB-Blaster devices"
