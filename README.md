# Version 1.0 - magic-device-tool

![alt text](https://raw.githubusercontent.com/MariusQuabeck/magic-device-tool/master/mdt.png "magic-device-tool logo")


A simple and feature full batch tool to handle installing/replacing Operating Systems (Ubuntu Phone / Ubuntu Touch, Android, CyanogenMod, Maru OS, Sailfish OS, and Phoenix OS) on your mobile devices.

Contact
-------
Marius Quabeck [(Email)](mailto:misterq@ubuntu.com?subject=magic-device-tool)

Mister_Q on irc.freenode.net

[Join us on Telegram](https://telegram.me/joinchat/A3LlWgiC4TQYX0epd9w8EQ)

# Standard Disclaimer Text
This tool **does not** let you Dual Boot between Android and Ubuntu Touch.
Not all ROMs are available for all devices.

Functions
---
- Ubuntu
  - Install Ubuntu Touch
  - Switch Channels
  - Install OpenStore
  - Screencast


- Android
  - Install CyanogenMod (with or without GApps)
  - Install Maru OS
  - Install Sailfish OS
  - Install Phoenix OS
  - Install Factory Android Image
  - Backup / Restore
  - Lock/Unlock bootloader
  - Install TWRP recovery

- Misc
  - Join Telegram Group Chat
  - Report a bug


Requirements
----
- Ubuntu 16.04 and above

Supported devices
----

- BQ Aquaris E4.5 (krillin)
- BQ Aquaris E5 HD (vegetahd)
- BQ Aquaris M10 HD (cooler)
- BQ Aquaris M10 FHD (frieza)
- Meizu MX 4 (arale)
- ~~Meizu Pro 5 (turbo)~~ removed until Marius can get his hands on this device
- LG Nexus 4 (mako)
- LG Nexus 5 (hammerhead)
- Asus Nexus 7 2013 WiFi (flo)
- Asus Nexus 7 2013 LTE (deb)
- Samsung Nexus 10 (manta)
- OnePlus One (bacon)
- ~~Fairphone 2 (FP2)~~ removed until the ubports build works again


Usage
-----
```
$ git clone https://github.com/MariusQuabeck/magic-device-tool.git
$ cd magic-device-tool
$ ./launcher.sh
```
FAQ
---
- Q: Will you support "device x"?     
  A: You can open an issue for a new device, if it has a working port of Ubuntu Touch. Most of them are at [ubports.com](https://ubports.com/). If your device isn't there, it probably has no working port, so please don't open new issues.

- Q: Will you port Ubuntu Touch to "device x"?     
  A: We are not responsible for porting Ubuntu Touch, so no.

- Q: What language is mdt written in?    
  A: Bash. So you don't have to give root to an app, you can't figure out.

- Q: How does mdt work?    
  A: mdt downloads some tools from the ubuntu repos and, depending on your choices, downloads the newest recovery and ROM for your device and flashes it. If you want to know more, just read the source (it's only bash :).

- Q: Is it called Ubuntu Touch, Ubuntu for devices, or just Ubuntu?   
  A: We really don't care ;) 

TODO
------
- Add more devices
- Add support for install F-Droid
- Add option "add udev rule"
- Add Zenity for success/failure prompts
- Give Aaron access to README
- Add Plasma Mobile
- Snap
- ~~Add Kali Linux~~
- ~~Add FAQ section~~
- Add FlymeOS for Meizu devices

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
