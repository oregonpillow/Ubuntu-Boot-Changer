#!/bin/bash

timestamp=$(date "+%d%m%Y%H%M%S")
LOGO=/usr/share/plymouth/ubuntu-logo.png
WATERMARK=/usr/share/plymouth/themes/spinner/watermark.png
WARNING="does not exist, the script won't work for your system."

if [ ! -d ./backup ]; then
    mkdir ./backup
fi

if [ ! -f "$LOGO" ]; then
    echo "$LOGO $WARNING"
fi

if [ ! -f "$WATERMARK" ]; then
    echo "$WATERMARK $WARNING"
fi

if [ ! -f "$LOGO" ] || [ ! -f "$WATERMARK" ]; then
    exit 1
fi


sudo mv $LOGO ./backup && mv ./backup/ubuntu-logo.png ./backup/ubuntu-logo_$timestamp.png
sudo mv $WATERMARK ./backup && mv ./backup/watermark.png ./backup/watermark_$timestamp.png

sudo cp ./new-logo.png $LOGO
sudo cp ./new-watermark.png $WATERMARK

sudo update-initramfs -u

echo Done. Reboot to see change.

