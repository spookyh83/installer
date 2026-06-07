step_partinfo() {

    if [ "$FIRMWARE" = "UEFI" ]
    then
        TEXT="This system was booted in UEFI mode.

Use a GPT partition table.

You must create an EFI System Partition (ESP).

Recommended layout:

  512M EFI System Partition (FAT32)
  Root partition (/)
  Optional swap partition

The EFI partition will be mounted on /boot/efi."
    else
        TEXT="This system was booted in BIOS mode.

Use a GPT partition table.

You must create a BIOS Boot partition.

Recommended layout:

  1M BIOS Boot partition
  Root partition (/)
  Optional swap partition

The BIOS Boot partition is required by GRUB2 on GPT disks."
    fi

    dialog \
        --title "Partitioning Information" \
        --msgbox "$TEXT" \
        20 60
}
