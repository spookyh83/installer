step_partition() {

    [ -z "$TARGET" ] && {
        msgbox "Error" "No target disk selected"
        return 1
    }

    clear

    cfdisk "/dev/$TARGET"

    clear

if yesno \
    "Partitioning" \
    "Have you finished partitioning /dev/$TARGET?"
then
    :
else
    step_partition
fi

partprobe "/dev/$TARGET" 2>/dev/null
udevadm settle 2>/dev/null


}
