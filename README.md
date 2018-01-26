# Version 1.0 - magic-device-tool

![alt text](https://raw.githubusercontent.com/MariusQuabeck/magic-device-tool/master/mdt.png "magic-device-tool logo")

A simple and featureful tool to handle installing/replacing Operating Systems (Ubuntu Phone / Ubuntu Touch, Android, LineageOS, Maru OS, Sailfish OS, and Phoenix OS) on your mobile devices.

## Contact

Marius Quabeck [(Email)](mailto:marius.quabeck@ubuntu.com?subject=magic-device-tool)

Mister_Q on the freenode IRC network

[Join us on Telegram !](https://t.me/joinchat/AAAAAAiC4TTYHRddjUbpXg)

[Donate if you like this tool](http://paypal.me/MisterQ)

[Buy me devices ;)](https://www.amazon.de/registry/wishlist/3GVUCIW2ZMWC8/ref=cm_sw_em_r_mt_ws__vfwnzbQCE8WVJ)



## Standard Disclaimer Text
This tool **does not** let you Dual Boot between Android and Ubuntu Touch.

Not all ROMs are available for all devices.

Functions
---
- Ubuntu Touch
  - Install Ubuntu Touch
  - Switch Channels
  - Install OpenStore
  - Screencast
  
- Ubuntu 13.04 Desktop (tilapia only)
  - Install Ubuntu 13.04 Desktop

- Android
  - Install CyanogenMod (with or without GApps)
  - Install LineageOS (with or without GApps)
  - Install Maru OS
  - Install Sailfish OS
  - Install Phoenix OS
  - Install Factory Android Image
  - Backup / Restore
  - Lock / Unlock bootloader
  - Install TWRP recovery

- Misc
  - Join Telegram Group Chat
  - Report a bug


System Requirements
----
- Ubuntu 16.04 and above
- A device from the supported list below
- USB cable for your device
- Internet connection

Supported devices
----

- BQ Aquaris E4.5 (krillin)
- BQ Aquaris E5 HD (vegetahd)
- BQ Aquaris M10 HD (cooler)
- BQ Aquaris M10 FHD (frieza)
- Meizu MX 4 (arale)
- Meizu Pro 5 (turbo)
- LG Nexus 4 (mako)
- LG Nexus 5 (hammerhead)
- Asus Nexus 7 2012 (tilapia)
- Asus Nexus 7 2013 WiFi (flo)
- Asus Nexus 7 2013 LTE (deb)
- Samsung Nexus 10 (manta)
- OnePlus One (bacon)
- Fairphone 2 (FP2)


Usage
-----

Use a [distro that is capable of Snaps](https://snapcraft.io/), open a terminal and run:

```
sudo snap install magic-device-tool --devmode
```
Run the snap
```
magic-device-tool
```

If you run into any adb/fastboot permission errors and mdt can't find your device, please start the snap as root

```sudo su``` or ```sudo bash```

```magic-device-tool```


FAQ
---
- Q: Will you support "device x"?     
  A: You can open an issue for a new device, if it has a working port of Ubuntu Touch. Most of them are at [ubports.com](https://ubports.com/). If your device isn't there, it probably has no working port, so please don't open new issues.

- Q: Will you port Ubuntu Touch to "device x"?     
  A: We are not responsible for porting Ubuntu Touch, so no.

- Q: What language is mdt written in?    
  A: Bash. So you don't have to give root to an app, you can't figure out.

- Q: How does mdt work?    
  A: mdt downloads some tools from the ubuntu repos and, depending on your choices, gets the newest recovery and ROM for your device and flashes it. If you want to know more, just read the source (it's only bash).

- Q: Is it called Ubuntu Touch, Ubuntu for devices, or just Ubuntu?   
  A: We really don't care ;)

- Q: What is the "OpenStore"?   
  A: An easy way to sideload apps on Ubuntu Touch. You can find more about it [here](https://open.uappexplorer.com/app/openstore.openstore-team).   

- Q: Do I need to root / prep my device?  
  A: No, just read the instructions on the screen and follow them carefully.

- Q: When i boot into recovery it says it's "locked". What can I do?  
  A: Run the option "Lock/Unlock bootloader" first

TODO
------
- Remove Ubuntu/UBports
- Add instructions for Solus
- Rename legacy to stable (UBports)
- Add Plasma Mobile
- Add Fairphone OS, Fairphone Open & Sailfish for FP2
- Add LineageOS Extras
- Add support to install F-Droid
- Add option "add udev rule"
- Add feature to flash SD cards with Raspian, Ubuntu,...
- Fix udev rules issues properly 


Special thanks to
---
- [Alan Pope](https://github.com/popey) & [Stuart Langridge](https://github.com/stuartlangridge) Screencast script
- [Aaron Honeycutt](https://github.com/ahoneybun) Translations & Testing
- [Marius Gripsgård](https://github.com/mariogrip) UBports
- [Brian Douglass](https://github.com/bhdouglass) OpenStore
- [LavrinosMixlu](https://github.com/LavrinosMixlu) Android Backup/Restore
- [michaelkisiel](https://github.com/michaelkisiel) [mdt-icons](https://github.com/michaelkisiel/mdt-icons)
- [pdsouza](https://github.com/pdsouza) [Maru OS](https://github.com/maruos/maruos)
- [kristbaum](https://github.com/kristbaum) FAQ section
- [Simon Quigley](https://github.com/tsimonq2) Readme corrections
- [Flohack74](https://github.com/Flohack74) Various code improvements
