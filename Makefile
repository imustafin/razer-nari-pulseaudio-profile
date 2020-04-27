VERSION=0.3

.PHONY: all build-deb

all: build-deb

clean:
	rm -rf build/*

build-deb:
	mkdir -p build/deb/DEBIAN build/deb/lib/udev/rules.d build/deb/usr/share/pulseaudio/alsa-mixer/profile-sets build/deb/usr/share/pulseaudio/alsa-mixer/paths
	cp control build/deb/DEBIAN/
	cp 91-pulseaudio-razer-nari.rules build/deb/lib/udev/rules.d/
	cp razer-nari-usb-audio.conf build/deb/usr/share/pulseaudio/alsa-mixer/profile-sets/
	cp razer-nari-output-game.conf build/deb/usr/share/pulseaudio/alsa-mixer/paths/
	cp razer-nari-output-chat.conf build/deb/usr/share/pulseaudio/alsa-mixer/paths/
	dpkg-deb --build build/deb build/pulseaudio-razer-nari_${VERSION}_all.deb

