#!/bin/sh

DIALOG=dialog

msgbox() {
    $DIALOG \
        --title "$1" \
        --msgbox "$2" \
        10 60
}

msgbox \
    "Welcome" \
    "Welcome to SH Linux, a Busybox musl Linux with pkgsrc for i586 computer"

yesno() {
    $DIALOG \
        --title "$1" \
        --yesno "$2" \
        10 60

    return $?
}
