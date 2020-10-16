#!/usr/bin/env bash

if [ "$1" == "inc" ]; then
	sudo xbacklight -inc 5
fi

if [ "$1" == "dec" ]; then
	sudo xbacklight -dec 5
fi

if [ "$1" == "max" ]; then
	sudo xbacklight -set 100
fi

if [ "$1" == "min" ]; then
	sudo xbacklight -set 1
fi

BACKLIGHT_BRIGHTNESS=$(xbacklight -get)
/home/moritz/.local/bin/notify-send.py "Set backlight to $BACKLIGHT_BRIGHTNESS%" \
	-u low \
	--hint string:image-path:video-display boolean:transient:true \
	--replaces-process "brightness-popup" &
