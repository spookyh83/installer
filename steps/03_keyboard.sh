step_keyboard() {

KEYMAP=$(
    dialog --stdout \
        --menu "Select keyboard layout" \
        12 50 4 \
        us "US (default)" \
        it "Italian" \
        de "German" \
        fr "French"
)

case "$KEYMAP" in
    us) ;;
    it) loadkeys /usr/share/kbd/keymaps/i386/qwerty/it.map.gz ;;
    de) loadkeys /usr/share/kbd/keymaps/i386/qwerty/de.map.gz ;;
    fr) loadkeys /usr/share/kbd/keymaps/i386/azerty/fr.map.gz ;;
esac

}


