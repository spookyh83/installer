step_firmware() {
if [ -d /sys/firmware/efi ]
then
    FIRMWARE=UEFI
else
    FIRMWARE=BIOS
fi

export FIRMWARE

msgbox \
    "Firmware" \
    "Detected firmware: $FIRMWARE"
}
