# Razer Nari pulseaudio profile

The Razer Nari is a gaming headset which has two stereo audio outputs. One for voice chat and one for the rest of the sound. It can be mixed between with a physical knob.

By default, pulseaudio only enables the voice chat output. This profile enables the second (game) output and the udev rule makes sure this profile is used when plugging in the device.

This solves the problem when only **mono** output is recognized for Nari.

## Installing

### PipeWire

If you use PipeWire and you see the default profiles (names like *Multichannel*)
but not these profiles (names like *Game Output*, *Chat Output*), then
you might need to change the udev rules.

In `91-pulseaudio-razer-nari.rules` change `PULSE_PROFILE_SET` to `ACP_PROFILE_SET`.

### Arch Linux

Install the package [from the AUR](https://aur.archlinux.org/packages/razer-nari-pulseaudio-profile/)

#### Devices not recognized on Arch
There was an update in the Arch `pulseaudio` package (https://github.com/imustafin/razer-nari-pulseaudio-profile/issues/5)
which changes the location of the profile files.

In pulseaudio `14.2-2` this was reverted
(https://github.com/imustafin/razer-nari-pulseaudio-profile/issues/12). If you
are using pulseaudio `>= 14.2-2`, then use the usual instructions for other distros.

If you are using pulseaudio `>= 13.99.2+7+g6101798c7, < 14.2-2`OR if you are using Pipewire-pulse then use these instructions:
- `razer-nari-input.conf`, `razer-nari-output-game.conf` and `razer-nari-output-chat.conf` should go to `/usr/share/alsa-card-profile/mixer/paths/`
- `razer-nari-usb-audio.conf` should go to `/usr/share/alsa-card-profile/mixer/profile-sets/`
- `91-pulseaudio-razer-nari.rules` to `/lib/udev/rules.d/` as usual

### Other Linux Systems

``cd`` into the ``razer-nari-pulseaudio-profile`` folder and run ``sudo chmod +x install.sh && ./install.sh``

### Other

Install by copying the following files:

- `razer-nari-input.conf`, `razer-nari-output-game.conf`, and `razer-nari-output-chat.conf` to `/usr/share/pulseaudio/alsa-mixer/paths/`
- `razer-nari-usb-audio.conf` to `/usr/share/pulseaudio/alsa-mixer/profile-sets/`
- `91-pulseaudio-razer-nari.rules` to `/lib/udev/rules.d/`

Script:
```
cp razer-nari-input.conf /usr/share/pulseaudio/alsa-mixer/paths/
cp razer-nari-output-{game,chat}.conf /usr/share/pulseaudio/alsa-mixer/paths/
cp razer-nari-usb-audio.conf /usr/share/pulseaudio/alsa-mixer/profile-sets/
cp 91-pulseaudio-razer-nari.rules /lib/udev/rules.d/
```

Restart pulseaudio:

    pulseaudio -k
    pulseaudio --start

After that, plug in the device to see if it works.
