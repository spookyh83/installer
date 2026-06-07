step_bootpart() {

    if [ "$FIRMWARE" = "UEFI" ]; then

        # cerca SOLO dentro il disco selezionato
        ESP_PART=$(lsblk -nrpo NAME,FSTYPE "$DISK" | awk '$2=="vfat"{print $1}' | head -n1)

        if [ -z "$ESP_PART" ]; then
            msgbox "ERROR" "No EFI System Partition found on $DISK!"
            return 1
        fi

        # controlla se è già in uso
        FSTYPE=$(blkid -o value -s TYPE "$ESP_PART" 2>/dev/null)

        if [ "$FSTYPE" = "vfat" ]; then

            if ! yesno "EFI Partition" \
"EFI partition found on $ESP_PART.

It already contains a FAT filesystem.

Do you want to FORMAT it?
(This may break existing operating systems)"; then

                msgbox "EFI" "Keeping existing EFI partition."
                export ESP_PART
                return 0
            fi
        fi

        mkfs.vfat -F32 "$ESP_PART"
        export ESP_PART

    else

        # BIOS + GPT: cerca BIOS boot partition SOLO su disco target
        BIOS_BOOT=$(lsblk -nrpo NAME "$DISK" | while read p; do
            blkid "$p" 2>/dev/null | grep -q "21686148-6449-6e6f-744e-656564454649" && echo "$p"
        done | head -n1)

        if [ -z "$BIOS_BOOT" ]; then
            msgbox "ERROR" "BIOS system detected but no BIOS Boot partition found on $DISK!"
            return 1
        fi

        export BIOS_BOOT
    fi
}
