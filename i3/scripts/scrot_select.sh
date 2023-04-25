scrot -f -b -s -q 100 'selected_window_%Y-%m-%d_%H-%M-%S_$wx$h.png' -e 'mv $f ~/Pictures/scrot/selected/' && dunstify -u low 'SCREENSHOT' 'Selected area'
