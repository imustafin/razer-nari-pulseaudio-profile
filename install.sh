#!/bin/bash
cp razer-nari-input.conf /usr/share/pulseaudio/alsa-mixer/paths/
cp razer-nari-output-{game,chat}.conf /usr/share/pulseaudio/alsa-mixer/paths/
cp razer-nari-usb-audio.conf /usr/share/pulseaudio/alsa-mixer/profile-sets/
cp 91-pulseaudio-razer-nari.rules /lib/udev/rules.d/

