#!/bin/sh

. ./lib/ui.sh

for step in ./steps/*.sh
do
    . "$step"
done

step_welcome
step_firmware
step_keyboard
step_disk
step_partinfo
step_partition
step_swapdetect
step_bootpart
