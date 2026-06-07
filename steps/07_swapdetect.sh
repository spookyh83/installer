step_swapdetect() {

    SWAP_PART=$(lsblk -nrpo NAME,TYPE | awk '$2=="part"{print $1}' | while read p; do
        blkid "$p" | grep -q "TYPE=\"swap\"" && echo "$p"
    done | head -n1)

    if [ -n "$SWAP_PART" ]; then
        msgbox "Swap" "Found swap partition: $SWAP_PART\nActivating it..."
        mkswap "$SWAP_PART" 2>/dev/null
        swapon "$SWAP_PART"
        export SWAP_PART
    else
        msgbox "Swap" "No swap partition detected."
    fi
}
