#!/bin/sh

DIALOG=dialog

msgbox() {
    $DIALOG \
        --title "$1" \
        --msgbox "$2" \
        10 60 
} 

yesno() {
    $DIALOG \
        --title "$1" \
        --yesno "$2" \
        10 60

    return $?
}
