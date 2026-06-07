step_disk() {

    MENU=""

    for disk in $(lsblk -d -n -o NAME)
    do
        size=$(lsblk -d -n -o SIZE /dev/$disk)
        MENU="$MENU $disk $size"
    done

    TARGET=$(
        dialog \
            --stdout \
            --menu "Select disk" \
            15 60 5 \
            $MENU
    )

    export TARGET
    export DISK="/dev/$TARGET"
}
