#!/usr/bin/env bash

conservation_mode=$(< /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode)
notification_text="An error occured when changing battery conservation mode"

if [ "$conservation_mode" == "1" ]; then
	conservation_mode=0
	notification_text="Battery conservation mode toggled off"
else
	conservation_mode=1
	notification_text="Battery conservation mode toggled on"
fi

echo $conservation_mode | sudo tee -a /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode

/home/moritz/.local/bin/notify-send.py "$notification_text" \
	-u low \
	--hint string:image-path:battery boolean:transient:true \
	--replaces-process "battery-conservation-popup" &
