# Ubuntu-Boot-Changer
A simple shell script to help you easily change the default boot logo / lock screen in Ubuntu.

## Requirements
- An Ubuntu version that uses Plymouth (the application which provides the graphical "splash" screen when booting and shutting down an Ubuntu system).
- sudo permissions (will be modifying images within Plymouth)
- place 2 PNG images for the logo and watermark inside the Ubuntu-Boot-Changer folder. *MUST BE NAMED new-logo.png & new-watermark.png respectively*


## Ubuntu versions confirmed to work
- Ubuntu 20.04.2 LTS (have not tested others yet)

## How to run

```
git clone https://github.com/oregonpillow/Ubuntu-Boot-Changer.git
cd Ubuntu-Boot-Changer
#make script executable
chmod +x boot-modifier.sh
bash boot-modifier.sh
```

## What script does
- checks to make sure that the original images inside the Ubuntu Plymouth actually exists, otherwise exits and informs you that the script won't work for you
- checks to make sure you have your 2 new images ready otherwise exits
- Assuming above 2 points are fine, creates a backup folder in the current dir and backups the current watermark/logo
- replaces the current watermark/logo with your new images.