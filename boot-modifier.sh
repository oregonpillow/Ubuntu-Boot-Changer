#!/bin/bash

timestamp=$(date "+%d%m%Y%H%M%S")
LOGO=/usr/share/plymouth/ubuntu-logo.png
WATERMARK=/usr/share/plymouth/themes/spinner/watermark.png
NEW_LOGO=./new-logo.png
NEW_WATERMARK=./new-watermark.png
DNE="does not exist"
WARNING="the script won't work for your system."

if [ ! -d ./backup ]; then
    mkdir ./backup
fi

if [ ! -f "$LOGO" ]; then
    echo "$LOGO $DNE"
fi

if [ ! -f "$WATERMARK" ]; then
    echo "$WATERMARK $DNE"
fi

if [ ! -f "$LOGO" ] || [ ! -f "$WATERMARK" ]; then
    echo "$WARNING"
    exit 1
fi

if [ ! -f "$NEW_LOGO" ]; then
    echo "$NEW_LOGO $DNE"
fi

if [ ! -f "$NEW_WATERMARK" ]; then
    echo "$NEW_WATERMARK $DNE"
fi

if [ ! -f "$NEW_LOGO" ] || [ ! -f "$NEW_WATERMARK" ]; then
    exit 1
fi

sudo mv $LOGO ./backup && mv ./backup/ubuntu-logo.png ./backup/ubuntu-logo_$timestamp.png
sudo mv $WATERMARK ./backup && mv ./backup/watermark.png ./backup/watermark_$timestamp.png

sudo cp ./new-logo.png $LOGO
sudo cp ./new-watermark.png $WATERMARK

sudo update-initramfs -u

echo Done. Reboot to see change.

